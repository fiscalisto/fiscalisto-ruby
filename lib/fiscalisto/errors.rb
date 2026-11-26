# frozen_string_literal: true

module Fiscalisto
  # Un error de la API (o de la conexión, con type "connection_error"). +code+ es estable: decida
  # con él (Fiscalisto::ErrorCode); el mensaje es para mostrarlo a una persona. Cada +type+ tiene
  # su clase (InvalidRequestError, RateLimitError…), así que también puede rescatar por clase.
  #
  #   begin
  #     fiscalisto.invoices.create(params)
  #   rescue Fiscalisto::InvoiceError => e
  #     puts e.code, e.sat_code, e.request_log_url
  #   end
  class Error < StandardError
    # invalid_request_error, authentication_error, permission_error, not_found_error,
    # idempotency_error, rate_limit_error, invoice_error, balance_error, api_error,
    # connection_error.
    attr_reader :type
    attr_reader :code
    # El campo que hay que corregir (items.0.unit_price).
    attr_reader :param
    # El código del SAT o del PAC cuando ellos lo rechazaron (CFDI40145).
    attr_reader :sat_code
    # El comprobante rechazado (inv_…), cuando lo hay.
    attr_reader :invoice
    attr_reader :doc_url
    # Búsquelo en Desarrolladores › Solicitudes o mándelo a soporte.
    attr_reader :request_id
    # La solicitud en Desarrolladores › Solicitudes, para abrirla en el navegador.
    attr_reader :request_log_url
    # La Idempotency-Key que se mandó: repita con ella para saber si se timbró.
    attr_reader :idempotency_key
    # El código HTTP (nil: la solicitud no llegó).
    attr_reader :status
    # El objeto error tal como llegó.
    attr_reader :raw

    # La clase de cada type.
    def self.for(raw, status = nil, request_id = nil, idempotency_key = nil)
      klass = TYPES.fetch(raw.is_a?(Hash) ? raw["type"] : nil, Error)
      klass.new(raw, status, request_id, idempotency_key)
    end

    def initialize(raw = {}, status = nil, request_id = nil, idempotency_key = nil)
      raw = raw.is_a?(Hash) ? raw.transform_keys(&:to_s) : {}
      text = ->(k) { raw[k].is_a?(String) ? raw[k] : nil }
      @raw = raw
      @type = text.call("type") || "api_error"
      @code = text.call("code") || "unknown"
      @param = text.call("param")
      @sat_code = text.call("sat_code")
      @invoice = text.call("invoice")
      @doc_url = text.call("doc_url")
      @request_id = text.call("request_id") || request_id
      @request_log_url = text.call("request_log_url")
      @idempotency_key = text.call("idempotency_key") || idempotency_key
      @status = status
      super(text.call("message") || "Error de la API de Fiscalisto")
    end

    def inspect
      "#<#{self.class.name} code=#{code.inspect} status=#{status.inspect} message=#{message.inspect}>"
    end
  end

  # 400: falta un campo o no es válido (param dice cuál).
  class InvalidRequestError < Error; end
  # 401: la llave no sirve, venció o no llegó.
  class AuthenticationError < Error; end
  # 403: la llave no puede hacer eso.
  class PermissionError < Error; end
  # 404: no existe (o no es de esta llave).
  class NotFoundError < Error; end
  # 409/422: la misma Idempotency-Key con otro cuerpo, o una que sigue en curso.
  class IdempotencyError < Error; end
  # 429: demasiadas solicitudes (el SDK ya esperó y reintentó).
  class RateLimitError < Error; end
  # 402/422: el SAT o el PAC no aceptó el comprobante (sat_code dice por qué).
  class InvoiceError < Error; end
  # 402: no quedan timbres.
  class BalanceError < Error; end
  # 5xx: falló de nuestro lado (o lo que contestó no era la API).
  class APIError < Error; end
  # La API no contestó: la red, un proxy o el tiempo de espera.
  class APIConnectionError < Error; end

  class Error
    TYPES = {
      "invalid_request_error" => InvalidRequestError,
      "authentication_error" => AuthenticationError,
      "permission_error" => PermissionError,
      "not_found_error" => NotFoundError,
      "idempotency_error" => IdempotencyError,
      "rate_limit_error" => RateLimitError,
      "invoice_error" => InvoiceError,
      "balance_error" => BalanceError,
      "api_error" => APIError,
      "connection_error" => APIConnectionError
    }.freeze
  end

  # El webhook no es de Fiscalisto: falta un encabezado, la hora o la firma no cuadran.
  class WebhookSignatureError < StandardError; end
end
