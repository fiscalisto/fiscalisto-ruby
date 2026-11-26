# frozen_string_literal: true

require "json"
require "net/http"
require "openssl"
require "securerandom"
require "time"
require "uri"

module Fiscalisto
  DEFAULT_BASE_URL = "https://api.fiscalisto.com"

  # Lo que el SDK manda (para un transport propio).
  HttpRequest = Struct.new(:method, :url, :headers, :body, :timeout, keyword_init: true)
  # Lo que el transport contesta: headers con nombres en minúsculas.
  HttpResponse = Struct.new(:status, :headers, :body, keyword_init: true)

  # Lo que un transport lanza cuando no hubo respuesta: el SDK reintenta lo que es seguro
  # repetir y, al final, lanza APIConnectionError.
  CONNECTION_ERRORS = [
    IOError, EOFError, SystemCallError, SocketError, Timeout::Error, OpenSSL::SSL::SSLError
  ].freeze

  # El transport de siempre: Net::HTTP de la biblioteca estándar, con la conexión abierta entre
  # una solicitud y la siguiente (keep-alive), una por hilo y por servidor. Otro transport es
  # cualquier objeto con call(HttpRequest) → HttpResponse (pruebas, proxies, otro cliente HTTP).
  class NetHttpTransport
    # Seconds an idle connection is reused; after that Net::HTTP opens a new one before sending.
    KEEP_ALIVE = 10

    def call(request)
      uri = URI(request.url)
      http = connection(uri)
      http.open_timeout = [request.timeout, 30].min
      http.read_timeout = request.timeout
      http.write_timeout = request.timeout
      klass = Net::HTTP.const_get(request[:method].capitalize)
      req = klass.new(uri.request_uri)
      request.headers.each { |k, v| req[k] = v }
      req.body = request.body if request.body
      begin
        res = http.request(req)
      rescue *CONNECTION_ERRORS
        # A connection that failed isn't used again: the next request (a retry) opens another.
        forget(uri)
        raise
      end
      headers = {}
      res.each_header { |k, v| headers[k.downcase] = v }
      HttpResponse.new(status: res.code.to_i, headers: headers, body: res.body.to_s)
    end

    # Closes this thread's open connections.
    def close
      pool.each_value { |http| http.finish if http.started? }
      pool.clear
    end

    private

    # Per thread (Net::HTTP isn't safe to share) and per process (a fork doesn't reuse the
    # parent's sockets).
    def pool
      key = :"fiscalisto_http_#{object_id}"
      held = Thread.current[key]
      held = Thread.current[key] = { pid: Process.pid, connections: {} } if held.nil? || held[:pid] != Process.pid
      held[:connections]
    end

    def connection(uri)
      origin = "#{uri.scheme}://#{uri.host}:#{uri.port}"
      http = pool[origin]
      return http if http&.started?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"
      http.keep_alive_timeout = KEEP_ALIVE
      http.open_timeout = 30
      http.start
      pool[origin] = http
    end

    def forget(uri)
      http = pool.delete("#{uri.scheme}://#{uri.host}:#{uri.port}")
      http.finish if http&.started?
    rescue IOError
      nil
    end
  end

  NET_HTTP_TRANSPORT = NetHttpTransport.new

  # La llave, la dirección de la API, los reintentos y el transport. Los recursos
  # (resources.rb, generado) solo dicen qué ruta llamar.
  class Core
    KEY = /\Afk_(live|test)_/.freeze
    OPTIONS = %i[idempotency_key timeout max_retries expand].freeze

    # api_key: su llave fk_test_… o fk_live_…; sin ella, la variable FISCALISTO_API_KEY.
    # timeout: segundos para cada respuesta (80 por omisión: el PAC puede tardar).
    # api_version: la versión de la API (Fiscalisto-Version); nil usa la de su cuenta.
    # language: "en" para los mensajes de error en inglés (Accept-Language).
    # transport: otro cliente HTTP (vea NET_HTTP_TRANSPORT); sleep: cómo esperar entre reintentos.
    # warn: cómo avisar que la llave vence pronto (Kernel.warn por omisión), una vez por cliente.
    def initialize(api_key = nil, base_url: nil, max_retries: 2, timeout: 80, transport: nil,
                   sleep: nil, api_version: API_VERSION, language: nil, warn: nil)
      key = api_key || ENV.fetch("FISCALISTO_API_KEY", nil)
      if key.nil? || key.empty?
        raise ArgumentError,
              'Falta la llave de la API: Fiscalisto::Client.new("fk_test_…") o la variable ' \
              "FISCALISTO_API_KEY. Créela en Desarrolladores › Llaves."
      end
      unless KEY.match?(key)
        raise ArgumentError,
              "La llave de la API empieza con fk_live_ o fk_test_. (Un secreto whsec_ es " \
              "para verificar webhooks.)"
      end

      @api_key = key
      # A proxy's path stays: https://proxy.example.com/fiscalisto + /v1/invoices.
      @base_url = (base_url || DEFAULT_BASE_URL).sub(%r{/+\z}, "")
      @max_retries = max_retries
      @timeout = timeout
      @transport = transport || NET_HTTP_TRANSPORT
      @sleep = sleep || ->(seconds) { Kernel.sleep(seconds) }
      @api_version = api_version
      @language = language
      @warn = warn || ->(message) { Kernel.warn(message) }
      @warned_expiry = false
    end

    WEEK = 7 * 24 * 60 * 60

    # The key's end, when the API says it's near (Fiscalisto-Key-Expires-At within 7 days, or
    # Fiscalisto-Warning: api_key_expires_soon): a message for the console, nil otherwise.
    def self.expiry_warning(headers, now = Time.now)
      expires_at = headers["fiscalisto-key-expires-at"].to_s
      at = begin
        Time.iso8601(expires_at)
      rescue ArgumentError
        nil
      end
      flagged = /\bapi_key_expires_soon\b/.match?(headers["fiscalisto-warning"].to_s)
      return nil unless flagged || (at && at > now && at - now <= WEEK)

      when_ = at ? "el #{at.utc.strftime("%Y-%m-%dT%H:%M:%SZ")}" : "en menos de 7 días"
      "[fiscalisto] Su llave de la API vence #{when_}. Cámbiela antes en Desarrolladores › " \
        "Llaves (Cambiar llave) para que sus solicitudes no fallen con api_key_expired."
    end

    # true con una llave fk_live_ (producción), false con fk_test_ (pruebas).
    def livemode?
      @api_key.start_with?("fk_live_")
    end
    alias livemode livemode?

    def inspect
      "#<#{self.class.name} base_url=#{@base_url.inspect} livemode=#{livemode?}>"
    end

    # Una llamada: method "GET"/"POST"/"DELETE", path "/v1/…". body o query son los params;
    # result :json (un FiscalistoObject), :bytes o :text. opts: idempotency_key, timeout,
    # max_retries, expand.
    def execute_request(method, path, body: nil, query: nil, idempotent: false, result: :json, opts: {})
      opts = check_options(opts, idempotent)
      body, query, expand = split_expand(body, query, opts[:expand])
      url = @base_url + path
      pairs = query_pairs(query)
      # Ids as their objects in the same answer: expand: ["issuer", "data.recurring_invoice"].
      expand.each { |field| pairs << ["expand[]", field.to_s] }
      url = "#{url}?#{URI.encode_www_form(pairs)}" unless pairs.empty?

      headers = {
        "authorization" => "Bearer #{@api_key}",
        "user-agent" => "fiscalisto-ruby/#{VERSION} ruby/#{RUBY_VERSION}",
        "accept" => "application/json"
      }
      headers["fiscalisto-version"] = @api_version if @api_version
      headers["accept-language"] = @language if @language
      key = idempotent ? (opts[:idempotency_key] || SecureRandom.uuid) : nil
      headers["idempotency-key"] = key if key
      data = nil
      if method == "POST"
        headers["content-type"] = "application/json"
        data = JSON.generate(body.nil? ? {} : body)
      end
      # Only what can't do something twice is repeated after a failure we can't see through:
      # reads, deletes and requests with an Idempotency-Key. A 429 was never processed.
      safe = %w[GET DELETE].include?(method) || !key.nil?
      retries = opts[:max_retries] || @max_retries
      wait = opts[:timeout] || @timeout

      attempt = 0
      loop do
        begin
          res = @transport.call(HttpRequest.new(method: method, url: url, headers: headers.dup,
                                                body: data, timeout: wait))
        rescue *CONNECTION_ERRORS => e
          if safe && attempt < retries
            @sleep.call(backoff(attempt))
            attempt += 1
            next
          end
          raise connection_error(e, key, wait)
        end
        request_id = res.headers["request-id"]
        unless @warned_expiry
          warning = Core.expiry_warning(res.headers)
          if warning
            @warned_expiry = true
            @warn.call(warning)
          end
        end
        if res.status >= 200 && res.status < 300
          return answer(res, result, request_id)
        end

        raw = error_body(res.body)
        # Retry-After when the API sends it; otherwise RateLimit-Reset on a 429 (seconds until
        # the next request fits).
        wait_header = res.headers["retry-after"] || (res.status == 429 ? res.headers["ratelimit-reset"] : nil)
        retry_after = Float(wait_header || "", exception: false) || 0.0
        retryable = res.status == 429 || raw["code"] == "request_in_progress" || (safe && res.status >= 500)
        if retryable && attempt < retries && retry_after <= 60
          @sleep.call(retry_after.positive? ? retry_after : backoff(attempt))
          attempt += 1
          next
        end
        raise Error.for(raw, res.status, request_id, key)
      end
    end

    # Una lista que se recorre sola (ListObject): cada página con los mismos params.
    def execute_list(path, params, opts: {})
      opts = check_options(opts, false)
      _, query, expand = split_expand(nil, params, opts[:expand])
      query = (query || {}).to_h.transform_keys(&:to_s)
      forward = !query["ending_before"].to_s.empty?
      page = lambda do |cursor|
        q = query.dup
        q[forward ? "ending_before" : "starting_after"] = cursor if cursor
        execute_request("GET", path, query: q, opts: opts.merge(expand: expand))
      end
      ListObject.new(page, forward: forward)
    end

    # What resources.rb calls: params (a Hash), opts (a Hash) and keywords, where a keyword
    # that is an option (idempotency_key, timeout, max_retries, expand) is one and any other
    # is a param: create({ … }, idempotency_key: "x") and list(status: "valid") both work.
    def call(method, path, params, opts, kw, send: nil, idempotent: false, result: :json)
      params, opts = arguments(params, opts, kw)
      execute_request(method, path, body: send == :body ? params : nil,
                                    query: send == :query ? params : nil,
                                    idempotent: idempotent, result: result, opts: opts)
    end

    def list_call(path, params, opts, kw)
      params, opts = arguments(params, opts, kw)
      execute_list(path, params, opts: opts)
    end

    # Un pedazo de la ruta (un id, un RFC, un UUID), escapado.
    def self.path(value)
      URI.encode_www_form_component(value.to_s).gsub("+", "%20")
    end

    private

    def arguments(params, opts, kw)
      options = (opts || {}).to_h.transform_keys(&:to_sym)
      rest = {}
      kw.each { |k, v| OPTIONS.include?(k.to_sym) ? options[k.to_sym] = v : rest[k] = v }
      unless params.nil? || params.is_a?(Hash) || params.respond_to?(:to_h)
        raise ArgumentError, "Los params van en un Hash: #{params.inspect}."
      end

      params = params.nil? ? (rest.empty? ? nil : rest) : params.to_h.merge(rest)
      [params, options]
    end

    def check_options(opts, idempotent)
      opts = (opts || {}).to_h.transform_keys(&:to_sym)
      unknown = opts.keys - OPTIONS
      raise ArgumentError, "Opciones que no existen: #{unknown.join(", ")} (son #{OPTIONS.join(", ")})." unless unknown.empty?
      if opts[:idempotency_key] && !idempotent
        raise ArgumentError, "Esta llamada no usa Idempotency-Key: repetirla no hace nada dos veces."
      end

      opts
    end

    # expand can also go in the params, as in Stripe: get("inv_…", expand: ["issuer"]).
    def split_expand(body, query, expand)
      fields = Array(expand).dup
      take = lambda do |params|
        next params unless params.is_a?(Hash) && (params.key?(:expand) || params.key?("expand"))

        params = params.dup
        fields.concat(Array(params.delete(:expand)), Array(params.delete("expand")))
        params
      end
      [take.call(body), take.call(query), fields.uniq]
    end

    def query_pairs(query)
      return [] if query.nil?

      query.to_h.each_with_object([]) do |(k, v), pairs|
        case v
        when nil then next
        when Array then v.each { |x| pairs << ["#{k}[]", x.to_s] }
        when Hash then v.each { |kk, vv| pairs << ["#{k}[#{kk}]", vv.to_s] unless vv.nil? }
        else pairs << [k.to_s, v.to_s]
        end
      end
    end

    def answer(res, result, request_id)
      case result
      when :bytes then res.body.to_s.b
      when :text then res.body.to_s.dup.force_encoding(Encoding::UTF_8)
      else
        begin
          raise JSON::ParserError, "vacía" if res.body.to_s.strip.empty?

          FiscalistoObject.construct(JSON.parse(res.body))
        rescue JSON::ParserError
          raise invalid_response(res, request_id)
        end
      end
    end

    def error_body(body)
      parsed = JSON.parse(body.to_s)
      parsed.is_a?(Hash) && parsed["error"].is_a?(Hash) ? parsed["error"] : {}
    rescue JSON::ParserError
      {}
    end

    # A success that isn't the API's JSON: a proxy's or a network portal's page answered instead.
    def invalid_response(res, request_id)
      text = res.body.to_s.dup.force_encoding(Encoding::UTF_8).scrub.split.join(" ")[0, 80]
      text = "vacía" if text.nil? || text.empty?
      Error.for({ "type" => "api_error", "code" => "invalid_response",
                  "message" => "La respuesta (#{res.status}) no es de la API: #{text}. ¿Hay un proxy o un portal de por medio?" },
                res.status, request_id)
    end

    def connection_error(error, key, wait)
      timed_out = error.is_a?(Timeout::Error) || error.message.include?("timed out")
      hint = key ? " Repita con la misma Idempotency-Key (#{key}) para saber si se timbró." : ""
      Error.for({ "type" => "connection_error",
                  "code" => timed_out ? "timeout" : "connection_failed",
                  "message" => timed_out ? "La API no contestó en #{wait} s.#{hint}" : "No se pudo conectar con la API: #{error.message}",
                  "idempotency_key" => key })
    end

    # 0.5 s, 1 s, 2 s… hasta 8 s, con algo de azar para no llegar todos juntos.
    def backoff(attempt)
      [8.0, 0.5 * (2**attempt)].min * (0.75 + (rand / 2))
    end
  end
end
