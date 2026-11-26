# frozen_string_literal: true

# El SDK sin red: un transport falso contesta como la API.

require "json"
require "minitest/autorun"
require "fiscalisto"

module Shared
  # In the published repository the shared fixtures sit in fixtures/ next to the code.
  def self.fixture(name)
    local = File.expand_path("../fixtures/#{name}", __dir__)
    path = File.exist?(local) ? local : File.expand_path("../../fixtures/#{name}", __dir__)
    JSON.parse(File.read(path))
  end
end

VECTOR = Shared.fixture("webhook.json")

ERROR = {
  "error" => {
    "type" => "invoice_error",
    "code" => "invoice_rejected",
    "message" => "El SAT no la aceptó.",
    "param" => "customer",
    "sat_code" => "CFDI40147",
    "invoice" => "inv_1",
    "doc_url" => "https://fiscalisto.com/docs/api/errores#invoice_rejected",
    "request_id" => "req_1",
    "request_log_url" => "https://fiscalisto.com/desarrolladores/solicitudes/req_1"
  }
}.freeze

# Contesta en orden; una excepción en la lista se lanza (red caída).
class Fake
  attr_reader :requests

  def initialize(*answers)
    @answers = answers
    @requests = []
  end

  def call(request)
    @requests << request
    a = @answers.shift
    raise a if a.is_a?(Exception)

    a
  end
end

def answer(status, body, headers = {})
  data = body.is_a?(String) ? body : JSON.generate(body)
  Fiscalisto::HttpResponse.new(status: status, headers: headers, body: data)
end

def page(ids, more)
  answer(200, { "object" => "list", "data" => ids.map { |i| { "id" => i } }, "has_more" => more })
end

class ClientTest < Minitest::Test
  def client(fake, **options)
    waits = []
    [Fiscalisto::Client.new("fk_test_abc", transport: fake, sleep: ->(s) { waits << s }, **options), waits]
  end

  def test_requires_a_key
    old = ENV.delete("FISCALISTO_API_KEY")
    error = assert_raises(ArgumentError) { Fiscalisto::Client.new }
    assert_includes error.message, "FISCALISTO_API_KEY"
    assert_raises(ArgumentError) { Fiscalisto::Client.new("whsec_abc") }
    ENV["FISCALISTO_API_KEY"] = "fk_live_abc"
    assert Fiscalisto::Client.new.livemode?
    refute Fiscalisto::Client.new("fk_test_abc").livemode?
  ensure
    old ? ENV["FISCALISTO_API_KEY"] = old : ENV.delete("FISCALISTO_API_KEY")
  end

  def test_sends_the_key_and_json
    fake = Fake.new(answer(200, { "id" => "cus_1", "object" => "customer", "address" => { "zip" => "33826" } }))
    f, = client(fake)
    customer = f.customers.create(tax_id: "ICV060329BY0", legal_name: "INMOBILIARIA CVA")
    request = fake.requests.first
    assert_equal "POST", request[:method]
    assert_equal "https://api.fiscalisto.com/v1/customers", request.url
    assert_equal "Bearer fk_test_abc", request.headers["authorization"]
    assert_equal Fiscalisto::API_VERSION, request.headers["fiscalisto-version"]
    assert_match %r{\Afiscalisto-ruby/\S+ ruby/}, request.headers["user-agent"]
    assert_equal({ "tax_id" => "ICV060329BY0", "legal_name" => "INMOBILIARIA CVA" }, JSON.parse(request.body))
    # Read as a method or as a Hash; the objects inside too.
    assert_equal "cus_1", customer.id
    assert_equal "cus_1", customer[:id]
    assert_equal "33826", customer.address.zip
    assert_equal "33826", customer.dig("address", "zip")
    assert_equal({ "zip" => "33826" }, customer.to_h["address"])
    # A version of your account's (nil) and English errors.
    fake = Fake.new(answer(200, {}))
    f, = client(fake, api_version: nil, language: "en")
    f.account.get
    refute fake.requests.first.headers.key?("fiscalisto-version")
    assert_equal "en", fake.requests.first.headers["accept-language"]
  end

  def test_path_values_are_escaped
    fake = Fake.new(answer(200, {}))
    f, = client(fake)
    f.customers.get("cus 1/2")
    assert_equal "https://api.fiscalisto.com/v1/customers/cus%201%2F2", fake.requests.first.url
  end

  def test_expands_related_objects
    fake = Fake.new(answer(200, { "id" => "inv_1", "issuer" => { "id" => "iss_1", "object" => "issuer" } }),
                    answer(200, { "id" => "inv_1", "issuer" => "iss_1" }))
    f, = client(fake)
    invoice = f.invoices.get("inv_1", expand: %w[issuer customer])
    assert_equal "https://api.fiscalisto.com/v1/invoices/inv_1?expand%5B%5D=issuer&expand%5B%5D=customer",
                 fake.requests.first.url
    assert_equal "issuer", invoice.issuer.object
    # In opts too, as in Stripe's second hash.
    f.invoices.get("inv_1", {}, { expand: ["issuer"] })
    assert fake.requests.last.url.end_with?("?expand%5B%5D=issuer")
  end

  def test_filters_by_metadata
    fake = Fake.new(answer(200, { "object" => "list", "data" => [], "has_more" => false }))
    f, = client(fake)
    f.customers.list(metadata: { pedido: "A-1042" }).data
    assert_equal "https://api.fiscalisto.com/v1/customers?metadata%5Bpedido%5D=A-1042", fake.requests.first.url
  end

  def test_stamping_gets_an_idempotency_key_reused_on_retries
    fake = Fake.new(answer(500, {}), answer(200, { "id" => "inv_1" }))
    f, waits = client(fake)
    f.invoices.create({ "items" => [] })
    keys = fake.requests.map { |r| r.headers["idempotency-key"] }
    refute_nil keys.first
    assert_equal keys.first, keys.last
    assert_equal 1, waits.length
  end

  def test_takes_your_idempotency_key
    fake = Fake.new(answer(200, {}), answer(200, {}))
    f, = client(fake)
    f.invoices.create({ "items" => [] }, idempotency_key: "pedido-1042")
    assert_equal "pedido-1042", fake.requests.first.headers["idempotency-key"]
    f.invoices.create({ "items" => [] }, { idempotency_key: "pedido-1043" })
    assert_equal "pedido-1043", fake.requests.last.headers["idempotency-key"]
    # A read has nothing to repeat twice.
    assert_raises(ArgumentError) { f.invoices.get("inv_1", idempotency_key: "x") }
    assert_raises(ArgumentError) { f.invoices.get("inv_1", {}, { nope: 1 }) }
  end

  def test_never_repeats_a_post_without_a_key
    # Your own call to a route, without idempotent: it may have worked, so it isn't repeated.
    fake = Fake.new(answer(500, { "error" => { "type" => "api_error", "code" => "internal_error", "message" => "x" } }))
    f, waits = client(fake)
    e = assert_raises(Fiscalisto::APIError) do
      f.execute_request("POST", "/v1/customers", body: { "tax_id" => "ICV060329BY0" })
    end
    assert_equal [500, 1], [e.status, fake.requests.length]
    refute fake.requests.first.headers.key?("idempotency-key")
    assert_empty waits
    fake = Fake.new(Errno::ECONNREFUSED.new)
    f, = client(fake)
    e = assert_raises(Fiscalisto::APIConnectionError) { f.execute_request("POST", "/v1/customers", body: {}) }
    assert_equal %w[connection_error connection_failed], [e.type, e.code]
  end

  def test_waits_what_retry_after_says
    fake = Fake.new(answer(429, {}, { "retry-after" => "3" }), answer(200, {}))
    f, waits = client(fake)
    f.account.get
    assert_equal [3.0], waits
    # More than a minute: the error, now.
    fake = Fake.new(answer(429, { "error" => { "type" => "rate_limit_error", "code" => "rate_limited", "message" => "x" } },
                           { "retry-after" => "120" }))
    f, waits = client(fake)
    assert_raises(Fiscalisto::RateLimitError) { f.account.get }
    assert_empty waits
  end

  def test_waits_ratelimit_reset_without_retry_after
    fake = Fake.new(answer(429, {}, { "ratelimit-reset" => "4" }), answer(200, {}))
    f, waits = client(fake)
    f.account.get
    assert_equal [4.0], waits
    # Retry-After wins when both come.
    fake = Fake.new(answer(429, {}, { "retry-after" => "2", "ratelimit-reset" => "7" }), answer(200, {}))
    f, waits = client(fake)
    f.account.get
    assert_equal [2.0], waits
  end

  def test_warns_once_when_the_key_expires_soon
    soon = (Time.now + (3 * 86_400)).utc.iso8601
    later = (Time.now + (30 * 86_400)).utc.iso8601
    said = []
    fake = Fake.new(answer(200, {}, { "fiscalisto-key-expires-at" => later }),
                    answer(200, {}, { "fiscalisto-key-expires-at" => soon }),
                    answer(200, {}, { "fiscalisto-key-expires-at" => soon }))
    f, = client(fake, warn: ->(m) { said << m })
    3.times { f.account.get }
    assert_equal 1, said.length
    assert_includes said[0], "vence el #{soon}"
    assert_includes said[0], "Desarrolladores › Llaves"
    # The header alone says so too, also on an error.
    said = []
    flagged = { "fiscalisto-warning" => "api_key_expires_soon; expires_at=x" }
    fake = Fake.new(answer(404, { "error" => { "type" => "invalid_request_error", "code" => "resource_missing", "message" => "x" } }, flagged))
    f, = client(fake, warn: ->(m) { said << m })
    assert_raises(Fiscalisto::Error) { f.account.get }
    assert_equal 1, said.length
    assert_includes said[0], "en menos de 7 días"
    assert_nil Fiscalisto::Core.expiry_warning({ "fiscalisto-key-expires-at" => later })
  end

  def test_waits_for_a_stamp_in_progress
    busy = { "error" => { "type" => "idempotency_error", "code" => "request_in_progress", "message" => "x" } }
    fake = Fake.new(answer(409, busy), answer(200, { "id" => "inv_1" }))
    f, = client(fake)
    assert_equal "inv_1", f.invoices.create({ "items" => [] }, idempotency_key: "k").id
  end

  def test_gives_up_after_max_retries
    fake = Fake.new(Errno::ECONNRESET.new, Errno::ECONNRESET.new, Errno::ECONNRESET.new)
    f, waits = client(fake)
    error = assert_raises(Fiscalisto::APIConnectionError) { f.account.get }
    assert_equal "connection_failed", error.code
    assert_equal 3, fake.requests.length
    assert_equal 2, waits.length
    fake = Fake.new(Net::ReadTimeout.new)
    f, = client(fake)
    error = assert_raises(Fiscalisto::Error) { f.invoices.create({ "items" => [] }, max_retries: 0) }
    assert_equal "timeout", error.code
    assert_includes error.message, "Idempotency-Key"
    refute_nil error.idempotency_key
  end

  def test_errors_carry_what_to_fix
    fake = Fake.new(answer(422, ERROR, { "request-id" => "req_header" }))
    f, = client(fake)
    e = assert_raises(Fiscalisto::InvoiceError) { f.invoices.create({ "items" => [] }) }
    assert_kind_of Fiscalisto::Error, e
    assert_equal ["invoice_error", "invoice_rejected", "customer", "CFDI40147", "inv_1", "req_1", 422],
                 [e.type, e.code, e.param, e.sat_code, e.invoice, e.request_id, e.status]
    assert_equal ERROR["error"]["request_log_url"], e.request_log_url
    assert_equal "El SAT no la aceptó.", e.message
    assert_equal Fiscalisto::ErrorCode::INVOICE_REJECTED, e.code
    # Not the API's: still a Fiscalisto::Error with the request's id.
    fake = Fake.new(answer(502, "<html>bad gateway</html>", { "request-id" => "req_2" }))
    f, = client(fake, max_retries: 0)
    e = assert_raises(Fiscalisto::Error) { f.account.get }
    assert_equal %w[unknown req_2], [e.code, e.request_id]
    # A success that isn't JSON (a proxy's or a network portal's page).
    fake = Fake.new(answer(200, "<html>Inicie sesion en la red</html>", { "request-id" => "req_3" }))
    f, = client(fake)
    e = assert_raises(Fiscalisto::APIError) { f.account.get }
    assert_equal ["api_error", "invalid_response", 200, "req_3"], [e.type, e.code, e.status, e.request_id]
  end

  def test_files_and_query
    fake = Fake.new(answer(200, "%PDF-1.7"), answer(200, "<cfdi:Comprobante/>"))
    f, = client(fake)
    pdf = f.invoices.pdf("inv_1")
    assert_equal "%PDF-1.7", pdf
    assert_equal Encoding::BINARY, pdf.encoding
    assert_equal "<cfdi:Comprobante/>", f.invoices.xml("inv_1")
    fake = Fake.new(page([], false))
    f, = client(fake)
    f.issuers.list(include_archived: true, limit: 5).to_a
    assert fake.requests.first.url.end_with?("?include_archived=true&limit=5")
  end

  def test_lists_walk_every_page
    fake = Fake.new(page(%w[cus_1 cus_2], true), page(%w[cus_3], false))
    f, = client(fake)
    listing = f.customers.list(limit: 2)
    assert_equal %w[cus_1 cus_2], listing.data.map(&:id)
    assert listing.has_more?
    assert_equal %w[cus_1 cus_2 cus_3], listing.map(&:id)
    assert fake.requests[1].url.end_with?("limit=2&starting_after=cus_2")
    # Only the pages it needs.
    fake = Fake.new(page(%w[cus_1 cus_2], true))
    f, = client(fake)
    assert_equal ["cus_1"], f.customers.list.first(1).map(&:id)
    assert_equal 1, fake.requests.length
    # ending_before walks toward the newest, oldest first.
    fake = Fake.new(page(%w[evt_3 evt_2], true), page(%w[evt_4], false))
    f, = client(fake)
    assert_equal %w[evt_2 evt_3 evt_4], f.events.list(ending_before: "evt_1", limit: 2).map(&:id)
    assert fake.requests[1].url.end_with?("ending_before=evt_3&limit=2")
  end

  def test_net_http_transport
    # The default transport against a one-answer server on this machine (no internet).
    require "socket"
    server = TCPServer.new("127.0.0.1", 0)
    seen = nil
    thread = Thread.new do
      socket = server.accept
      head = +""
      head << socket.gets until head.end_with?("\r\n\r\n")
      length = head[/content-length: (\d+)/i, 1].to_i
      seen = [head, socket.read(length)]
      body = '{"id":"cus_1","object":"customer"}'
      socket.write("HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nRequest-Id: req_9\r\n" \
                   "Content-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}")
      socket.close
    end
    f = Fiscalisto::Client.new("fk_test_abc", base_url: "http://127.0.0.1:#{server.addr[1]}/")
    assert_equal "cus_1", f.customers.create(tax_id: "ICV060329BY0").id
    thread.join
    assert_match %r{\APOST /v1/customers HTTP/1.1}, seen[0]
    assert_match(/^authorization: Bearer fk_test_abc\r$/i, seen[0])
    assert_match(/^idempotency-key: \S+\r$/i, seen[0])
    assert_equal({ "tax_id" => "ICV060329BY0" }, JSON.parse(seen[1]))
  ensure
    server&.close
  end

  def test_net_http_transport_keeps_the_connection
    # Two requests, one connection: the server answers both on the same socket.
    require "socket"
    server = TCPServer.new("127.0.0.1", 0)
    connections = 0
    thread = Thread.new do
      socket = server.accept
      connections += 1
      2.times do
        head = +""
        head << socket.gets until head.end_with?("\r\n\r\n")
        body = '{"id":"acct_1","object":"account"}'
        socket.write("HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n" \
                     "Content-Length: #{body.bytesize}\r\n\r\n#{body}")
      end
      socket.close
    end
    transport = Fiscalisto::NetHttpTransport.new
    f = Fiscalisto::Client.new("fk_test_abc", base_url: "http://127.0.0.1:#{server.addr[1]}", transport: transport)
    2.times { assert_equal "acct_1", f.account.get.id }
    thread.join
    assert_equal 1, connections
  ensure
    transport&.close
    server&.close
  end

  def test_every_route_has_a_method
    f = Fiscalisto::Client.new("fk_test_x")
    Shared.fixture("calls.json").each do |route, call|
      resource, name = call.fetch("ruby").split(".")
      target = f.public_send(resource)
      assert target.class.public_method_defined?(name, false), "#{route}: #{call["ruby"]}"
    end
  end
end

class WebhookTest < Minitest::Test
  H = VECTOR["headers"]
  AT = VECTOR["timestamp"]

  def test_verifies_standard_webhooks
    event = Fiscalisto::Webhook.verify(VECTOR["body"], H, VECTOR["secret"], now: AT)
    assert_equal "invoice.stamped", event.type
    assert_equal "Ñ-1", event.data.object.folio
    f = Fiscalisto::Client.new("fk_test_x")
    assert_equal H["webhook-id"], f.webhooks.verify(VECTOR["body"].b, H, VECTOR["secret"], now: AT).id
    # While a secret changes, two signatures: either one is enough.
    Fiscalisto::Webhook.verify(VECTOR["body"], H.merge("webhook-signature" => VECTOR["overlap_signature"]),
                               VECTOR["secret"], now: AT)
    # Header names in any case, Rack's env, lists of values.
    titled = H.to_h { |k, v| [k.split("-").map(&:capitalize).join("-"), v] }
    Fiscalisto::Webhook.verify(VECTOR["body"], titled, VECTOR["secret"], now: AT)
    upper = H.to_h { |k, v| [k.upcase, v] }
    Fiscalisto::Webhook.verify(VECTOR["body"], upper, VECTOR["secret"], now: AT)
    env = H.to_h { |k, v| ["HTTP_#{k.upcase.tr("-", "_")}", v] }
    Fiscalisto::Webhook.verify(VECTOR["body"], env, VECTOR["secret"], now: AT)
    Fiscalisto::Webhook.verify(VECTOR["body"], H.transform_values { |v| [v] }, VECTOR["secret"], now: AT)
  end

  def test_refuses_what_isnt_from_fiscalisto
    [
      [VECTOR["body"], H.merge("webhook-signature" => VECTOR["wrong_signature"]), VECTOR["secret"], AT],
      ["#{VECTOR["body"]} ", H, VECTOR["secret"], AT],
      [VECTOR["body"], H, VECTOR["secret"], AT + 301],
      [VECTOR["body"], { "webhook-id" => H["webhook-id"] }, VECTOR["secret"], AT],
      [VECTOR["body"], H, "fk_test_x", AT],
      [VECTOR["body"], H, "whsec_no base64!", AT],
      [JSON.parse(VECTOR["body"]), H, VECTOR["secret"], AT]
    ].each do |payload, headers, secret, now|
      assert_raises(Fiscalisto::WebhookSignatureError) do
        Fiscalisto::Webhook.verify(payload, headers, secret, now: now)
      end
    end
  end
end
