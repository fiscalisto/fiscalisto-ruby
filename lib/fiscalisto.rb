# frozen_string_literal: true

# El SDK de la API de facturación de Fiscalisto.
#
#   require "fiscalisto"
#
#   fiscalisto = Fiscalisto::Client.new # la llave viene de FISCALISTO_API_KEY
#   invoice = fiscalisto.invoices.create(
#     {
#       customer: { tax_id: "ICV060329BY0", legal_name: "INMOBILIARIA CVA", tax_system: "601", zip: "33826" },
#       payment_form: "03",
#       items: [{ description: "Consultoría", product_key: "80101500", unit_price: 1000 }]
#     },
#     idempotency_key: "pedido-A-1042"
#   )
#   puts invoice.uuid
#
# https://fiscalisto.com/docs/api
module Fiscalisto
end

require_relative "fiscalisto/version"
require_relative "fiscalisto/errors"
require_relative "fiscalisto/error_codes"
require_relative "fiscalisto/fiscalisto_object"
require_relative "fiscalisto/list_object"
require_relative "fiscalisto/core"
require_relative "fiscalisto/webhooks"
require_relative "fiscalisto/resources"

module Fiscalisto
  # El cliente de la API: Fiscalisto::Client.new("fk_test_…") o, sin llave, FISCALISTO_API_KEY.
  #
  # Opciones: base_url, max_retries (2), timeout (80 s), transport (otro cliente HTTP),
  # api_version (la de la API, por omisión API_VERSION; nil usa la de su cuenta), language
  # ("en" para los errores en inglés) y warn (cómo avisar que la llave vence pronto; Kernel.warn).
  #
  # Cada recurso es un método (fiscalisto.invoices, fiscalisto.customers…) y cada llamada recibe
  # sus params (un Hash) y, al final, las opciones de esa llamada: idempotency_key (en lo que
  # timbra o crea), timeout, max_retries y expand.
  class Client < Core
    include Resources

    # Verificar lo que llega a su endpoint.
    def webhooks
      @webhooks ||= Webhooks.new
    end
  end
end
