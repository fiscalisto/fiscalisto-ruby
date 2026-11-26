# frozen_string_literal: true

require "json"
require "openssl"

module Fiscalisto
  # Verificar que un webhook lo mandó Fiscalisto (Standard Webhooks): la firma HMAC-SHA256 de
  # `webhook-id.webhook-timestamp.cuerpo` con el secreto whsec_ del endpoint.
  #
  #   # Rails: request.raw_post y request.headers; Sinatra/Rack: request.body.read y request.env
  #   event = Fiscalisto::Webhook.verify(request.raw_post, request.headers, ENV["FISCALISTO_WEBHOOK_SECRET"])
  #   case event.type
  #   when "invoice.stamped" then puts event.data.object.uuid
  #   end
  module Webhook
    module_function

    # Revisa la firma y la hora de un webhook y le devuelve el evento (un FiscalistoObject).
    # Pase el cuerpo exactamente como llegó, no el JSON ya interpretado: un espacio de diferencia
    # cambia la firma. headers: un Hash (cualquier mayúscula), el env de Rack o request.headers
    # de Rails. Lanza WebhookSignatureError si no es de Fiscalisto.
    def verify(payload, headers, secret, tolerance: 300, now: nil)
      unless payload.is_a?(String)
        raise WebhookSignatureError,
              "Pase el cuerpo del webhook tal como llegó (texto), no el JSON ya interpretado."
      end

      body = payload.b
      msg_id = header(headers, "webhook-id")
      timestamp = header(headers, "webhook-timestamp")
      signatures = header(headers, "webhook-signature")
      if [msg_id, timestamp, signatures].any? { |v| v.nil? || v.empty? }
        raise WebhookSignatureError, "Faltan los encabezados webhook-id, webhook-timestamp o webhook-signature."
      end

      current = now || Time.now.to_f
      if !timestamp.match?(/\A\d+\z/) || (current - timestamp.to_i).abs > tolerance
        raise WebhookSignatureError, "La hora del webhook está fuera de tolerancia: puede ser una repetición."
      end
      raise WebhookSignatureError, "El secreto del endpoint empieza con whsec_." unless secret.to_s.start_with?("whsec_")

      begin
        key = secret.delete_prefix("whsec_").unpack1("m0") # strict Base64 (no base64 gem: Ruby 3.4 unbundled it)
      rescue ArgumentError
        raise WebhookSignatureError, "El secreto del endpoint no es válido."
      end
      expected = OpenSSL::HMAC.digest("SHA256", key, "#{msg_id}.#{timestamp}.".b + body)
      # Several during a secret change, separated by spaces: any one valid is enough.
      signatures.split(" ").each do |part|
        version, signature = part.split(",", 2)
        next unless version == "v1" && signature && !signature.empty?

        given = begin
          signature.unpack1("m0")
        rescue ArgumentError
          next
        end
        next unless given.bytesize == expected.bytesize && OpenSSL.fixed_length_secure_compare(given, expected)

        return FiscalistoObject.construct(JSON.parse(body.force_encoding(Encoding::UTF_8)))
      end
      raise WebhookSignatureError, "La firma del webhook no coincide con el secreto."
    end

    # Rails' request.headers and Rack's env (HTTP_WEBHOOK_ID) or any Hash, in any case.
    def header(headers, name)
      rack = "HTTP_#{name.upcase.tr("-", "_")}"
      [name, name.split("-").map(&:capitalize).join("-"), rack].each do |key|
        value = begin
          headers[key]
        rescue StandardError
          nil
        end
        value = value.first if value.is_a?(Array)
        return value.to_s unless value.nil?
      end
      return nil unless headers.respond_to?(:each)

      headers.each do |key, value|
        next unless key.to_s.downcase == name

        return (value.is_a?(Array) ? value.first : value).to_s
      end
      nil
    end
  end

  # fiscalisto.webhooks: verificar lo que llega a su endpoint.
  class Webhooks
    # Igual que Fiscalisto::Webhook.verify.
    def verify(payload, headers, secret, tolerance: 300, now: nil)
      Webhook.verify(payload, headers, secret, tolerance: tolerance, now: now)
    end
  end
end
