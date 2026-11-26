# frozen_string_literal: true

# Generado por `bun run openapi` desde la especificación OpenAPI de la API: no lo edite.

module Fiscalisto
  # Cuenta: fiscalisto.account.
  class AccountResource
    def initialize(client)
      @client = client
    end

    # Ver la cuenta
    #
    # La cuenta API y la llave con que se hizo la solicitud. Útil para probar la llave.
    #
    # GET /v1/account
    # https://fiscalisto.com/docs/api/referencia/cuenta/get-account
    #
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(opts = nil, **kw)
      @client.call("GET", "/v1/account", nil, opts, kw)
    end

    # Cambiar la versión de la API
    #
    # Mueve la versión de la API de la cuenta: la que reciben sus solicitudes sin el encabezado Fiscalisto-Version y sus webhooks sin api_version propio. Antes, pruebe la nueva mandando Fiscalisto-Version en sus solicitudes. Con una llave de la cuenta con todos los permisos (no de un entorno de prueba). Queda en Desarrolladores › Actividad.
    #
    # POST /v1/account
    # https://fiscalisto.com/docs/api/referencia/cuenta/update-account
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :api_version (obligatorio) La versión de la API de la cuenta: la que reciben sus solicitudes sin Fiscalisto-Version y sus webhooks sin a…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/account", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Cuenta: fiscalisto.test_data.
  class TestDataResource
    def initialize(client)
      @client = client
    end

    # Reiniciar los datos de prueba
    #
    # Deja el modo de pruebas como nuevo: cada emisor de pruebas conserva su RFC y su CSD de pruebas pero pierde sus facturas, clientes, productos, lotes, ligas y descargas, y se borran los eventos y el registro de solicitudes de pruebas. Las llaves y los webhooks se quedan. Con seed (por omisión) deja 2 clientes y 3 productos de ejemplo. Solo con una llave fk_test_; producción nunca se toca.
    #
    # POST /v1/test_data/reset
    # https://fiscalisto.com/docs/api/referencia/cuenta/reset-test-data
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Boolean] :seed true (por omisión) para dejarle a cada emisor de pruebas 2 clientes y 3 productos de ejemplo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reset(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/test_data/reset", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Entornos de prueba: fiscalisto.sandboxes.
  class SandboxesResource
    def initialize(client)
      @client = client
    end

    # Crear un entorno de prueba
    #
    # Un modo de pruebas propio para una persona o un proyecto: nace con el emisor de pruebas del SAT y una llave fk_test_ (key.secret, una sola vez) que solo ve los emisores, webhooks y eventos del entorno, y que reinicia solo los suyos. Se crea con una llave de pruebas de la cuenta (no de otro entorno ni limitada a emisores). Hasta 25 por cuenta.
    #
    # POST /v1/sandboxes
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/create-sandbox
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name (obligatorio) Para quién o para qué es, por ejemplo el nombre de quien lo usa.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sandboxes", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar entornos de prueba
    #
    # Los entornos de prueba de la cuenta, cada uno con su emisor de prueba y su llave fk_test_. Hasta 25 por cuenta.
    #
    # GET /v1/sandboxes
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/list-sandboxes
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sandboxes", params, opts, kw, send: :query)
    end

    # Ver un entorno de prueba
    #
    # Un entorno de prueba: su nombre, su emisor y lo que lleva usado hoy de sus reinicios.
    #
    # GET /v1/sandboxes/{id}
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/get-sandbox
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sandboxes/#{Core.path(id)}", nil, opts, kw)
    end

    # Borrar un entorno de prueba
    #
    # Sus llaves dejan de funcionar al momento, sus emisores se archivan y sus webhooks se borran. No toca nada de la cuenta ni de otros entornos.
    #
    # DELETE /v1/sandboxes/{id}
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/delete-sandbox
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/sandboxes/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Entornos de prueba: fiscalisto.test_clocks.
  class TestClocksResource
    def initialize(client)
      @client = client
    end

    # Crear un reloj de prueba
    #
    # Le da a un emisor de pruebas su propia hora, congelada en frozen_time (ahora, si no la manda): sus facturas recurrentes, cotizaciones, cuentas por cobrar y tickets cuentan los días con ella, y nada de eso corre solo hasta que usted lo adelanta. Para ver en segundos lo que pasa en meses. Solo emisores de prueba; uno por emisor.
    #
    # POST /v1/issuers/{id}/test_clock
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/create-test-clock
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :frozen_time Dónde empieza el reloj; si no la manda, ahora.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/test_clock", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver el reloj de prueba
    #
    # La hora que es «hoy» para un emisor de prueba y hasta dónde se ha adelantado. Solo emisores de prueba.
    #
    # GET /v1/issuers/{id}/test_clock
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/get-test-clock
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/test_clock", nil, opts, kw)
    end

    # Borrar el reloj de prueba
    #
    # El emisor vuelve a la hora real; lo que el reloj dejó pendiente lo hacen los procesos diarios.
    #
    # DELETE /v1/issuers/{id}/test_clock
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/delete-test-clock
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/issuers/#{Core.path(id)}/test_clock", nil, opts, kw)
    end

    # Adelantar el reloj de prueba
    #
    # Mueve el reloj hasta frozen_time haciendo, día por día, lo que habría pasado: timbra las facturas recurrentes de cada periodo, vence las cotizaciones y hace las facturas globales de tickets, con sus eventos. Contesta cuando terminó, con lo que hizo en advanced, y llega test_clock.ready. Hasta 25 comprobantes por solicitud: si se detiene antes, stopped_early y otra llamada sigue. Los CFDI se timbran con la fecha real (el SAT solo acepta la de hoy); el periodo, los vencimientos y los eventos siguen al reloj.
    #
    # POST /v1/issuers/{id}/test_clock/advance
    # https://fiscalisto.com/docs/api/referencia/entornos-de-prueba/advance-test-clock
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :frozen_time (obligatorio) A dónde adelantarlo: después de la hora actual del reloj.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def advance(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/test_clock/advance", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Cuenta: fiscalisto.balance.
  class BalanceResource
    def initialize(client)
      @client = client
    end

    # Ver los timbres
    #
    # Los timbres de producción que le quedan, por paquete. En pruebas se timbra gratis.
    #
    # GET /v1/balance
    # https://fiscalisto.com/docs/api/referencia/cuenta/get-balance
    #
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(opts = nil, **kw)
      @client.call("GET", "/v1/balance", nil, opts, kw)
    end
  end

  # Emisores: fiscalisto.issuers.
  class IssuersResource
    def initialize(client)
      @client = client
    end

    # Crear un emisor
    #
    # Agrega un RFC que va a timbrar. Después suba su CSD (POST /v1/issuers/{id}/certificates) y, solo en producción, firme una vez el contrato con el PAC con su e.firma (POST /v1/issuers/{id}/efirma).
    #
    # POST /v1/issuers
    # https://fiscalisto.com/docs/api/referencia/emisores/create-issuer
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :tax_id (obligatorio) RFC (Rfc), 12 caracteres una persona moral y 13 una física.
    # @option params [String] :legal_name (obligatorio) Nombre o razón social tal como está en la constancia de situación fiscal, sin el régimen de capital (sin «S.A.
    # @option params [String] :tax_system (obligatorio) Régimen fiscal (RegimenFiscal), clave de c_RegimenFiscal: 601, 612, 626…
    # @option params [String] :zip (obligatorio) Código postal del domicilio fiscal, 5 dígitos, como en la constancia de situación fiscal.
    # @option params [String] :employer_registration Registro patronal ante el IMSS (RegistroPatronal), 11 caracteres.
    # @option params [String] :curp CURP, 18 caracteres.
    # @option params [Hash] :donation_authorization Donataria autorizada (régimen 603): el oficio del SAT que la autoriza a recibir donativos deducibles (o su re…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar emisores
    #
    # Los emisores de la cuenta en el modo de la llave, los más recientes primero. Una llave limitada a algunos emisores solo ve los suyos.
    #
    # GET /v1/issuers
    # https://fiscalisto.com/docs/api/referencia/emisores/list-issuers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :tax_id Solo el de este RFC.
    # @option params [Boolean] :include_archived true para incluir los archivados.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/issuers", params, opts, kw)
    end

    # Ver un emisor
    #
    # Un emisor: sus datos fiscales, si ya puede timbrar (status, CSD y contrato con el PAC) y su registro patronal.
    #
    # GET /v1/issuers/{id}
    # https://fiscalisto.com/docs/api/referencia/emisores/get-issuer
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un emisor
    #
    # Solo cambia lo que mande. El RFC no cambia: cree otro emisor.
    #
    # POST /v1/issuers/{id}
    # https://fiscalisto.com/docs/api/referencia/emisores/update-issuer
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :legal_name Nombre o razón social tal como está en la constancia de situación fiscal, sin el régimen de capital (sin «S.A.
    # @option params [String] :tax_system Régimen fiscal (RegimenFiscal), clave de c_RegimenFiscal: 601, 612, 626…
    # @option params [String] :zip Código postal del domicilio fiscal, 5 dígitos, como en la constancia de situación fiscal.
    # @option params [String] :employer_registration Registro patronal ante el IMSS (RegistroPatronal), 11 caracteres.
    # @option params [String] :curp CURP, 18 caracteres.
    # @option params [Hash] :donation_authorization Donataria autorizada (régimen 603): el oficio del SAT que la autoriza a recibir donativos deducibles (o su re…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Archivar un emisor
    #
    # Deja de timbrar; sus comprobantes se quedan.
    #
    # DELETE /v1/issuers/{id}
    # https://fiscalisto.com/docs/api/referencia/emisores/archive-issuer
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def archive(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/issuers/#{Core.path(id)}", nil, opts, kw)
    end

    # Subir el CSD
    #
    # El certificado de sello digital (.cer y .key en base64) y la contraseña de la llave. Se guarda cifrado y solo se usa para sellar. En pruebas se revisa pero se timbra con el CSD de pruebas del SAT.
    #
    # POST /v1/issuers/{id}/certificates
    # https://fiscalisto.com/docs/api/referencia/emisores/upload-certificate
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :cer (obligatorio) El archivo .cer en base64 (puede traer el prefijo data:).
    # @option params [String] :key (obligatorio) El archivo .key en base64 (puede traer el prefijo data:).
    # @option params [String] :password (obligatorio) La contraseña de la llave privada (.key).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def upload_certificate(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/certificates", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver el diseño del PDF
    #
    # Cómo se ven los documentos del emisor: su nombre comercial, el estilo y el color del PDF y su logo. Es lo mismo que Ajustes › Marca y documentos en la app.
    #
    # GET /v1/issuers/{id}/branding
    # https://fiscalisto.com/docs/api/referencia/emisores/get-issuer-branding
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get_branding(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/branding", nil, opts, kw)
    end

    # Cambiar el diseño del PDF
    #
    # Cambia el nombre comercial, el estilo (clasico, moderno, compacto o minimalista) y el color del PDF de las facturas, notas, pagos, recibos y cotizaciones del emisor, y de sus correos. Lo que no mande se queda como está; null vuelve al de omisión. Se ve en el siguiente PDF que pida, también de lo ya timbrado. Una sucursal puede tener el suyo (POST /v1/branches/{id}).
    #
    # POST /v1/issuers/{id}/branding
    # https://fiscalisto.com/docs/api/referencia/emisores/update-issuer-branding
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :trade_name Su nombre comercial, si se presenta con otra marca: va en grande en el PDF, en el correo y en la página de la…
    # @option params [String] :pdf_style Estilo del PDF: clasico (por omisión), moderno (encabezado y total con color, renglones alternados), compacto…
    # @option params [String] :pdf_color Color del PDF, como #2563EB.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_branding(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/branding", params, opts, kw, send: :body, idempotent: true)
    end

    # Subir el logo
    #
    # El logo del emisor (PNG o JPG de hasta 1 MB, en base64): va en sus PDF, sus correos y la página de la factura que ve su cliente. Reemplaza el anterior.
    #
    # POST /v1/issuers/{id}/logo
    # https://fiscalisto.com/docs/api/referencia/emisores/upload-issuer-logo
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :file (obligatorio) El logo, PNG o JPG de hasta 1 MB, en base64 (con o sin el prefijo data:image/png;base64,).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def upload_logo(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/logo", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar el logo
    #
    # Sus PDF y correos van sin logo, con su nombre.
    #
    # DELETE /v1/issuers/{id}/logo
    # https://fiscalisto.com/docs/api/referencia/emisores/delete-issuer-logo
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_logo(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/issuers/#{Core.path(id)}/logo", nil, opts, kw)
    end

    # Firmar el contrato con el PAC
    #
    # Una sola vez por RFC antes de timbrar en producción: firma el contrato de servicio del PAC con la e.firma del emisor. La e.firma se usa en memoria para esa firma y no se guarda, salvo que mande keep_for_downloads: true para pedirle al SAT las facturas del emisor (POST /v1/sat_downloads); entonces se guarda cifrada y puede borrarla con DELETE. En pruebas no firma nada ni se guarda: con keep_for_downloads se revisa igual y queda su vencimiento en sat_downloads.efirma_expires_at.
    #
    # POST /v1/issuers/{id}/efirma
    # https://fiscalisto.com/docs/api/referencia/emisores/sign-efirma
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :cer (obligatorio) El archivo .cer en base64 (puede traer el prefijo data:).
    # @option params [String] :key (obligatorio) El archivo .key en base64 (puede traer el prefijo data:).
    # @option params [String] :password (obligatorio) La contraseña de la llave privada (.key).
    # @option params [Boolean] :keep_for_downloads true para guardarla (cifrada) y poder pedir al SAT las facturas del emisor con POST /v1/sat_downloads.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def sign_efirma(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/efirma", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar la e.firma guardada
    #
    # Borra la e.firma que guardó con keep_for_downloads. El emisor sigue timbrando; ya no puede pedir descargas al SAT hasta que la mande de nuevo.
    #
    # DELETE /v1/issuers/{id}/efirma
    # https://fiscalisto.com/docs/api/referencia/emisores/delete-efirma
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_efirma(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/issuers/#{Core.path(id)}/efirma", nil, opts, kw)
    end

    # Crear una liga de alta
    #
    # Una página en fiscalisto.com donde el dueño del emisor sube su CSD y firma el contrato con el PAC con su e.firma, sin que esos archivos ni sus contraseñas pasen por su plataforma. Con keep_efirma: true la página también le pide autorización para guardar su e.firma cifrada, para consultar el SAT (descargas, declaraciones, opinión, constancia y buzón); con efirma_only: true pide solo la e.firma, sin el CSD. Mande a su cliente a url; al terminar vuelve a return_url y llega issuer.ready. Cada liga sirve para un emisor, hasta que vence.
    #
    # POST /v1/issuers/{id}/onboarding_links
    # https://fiscalisto.com/docs/api/referencia/emisores/create-issuer-onboarding-link
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :return_url A dónde regresa el botón al terminar, por ejemplo la página de su plataforma donde su cliente sigue.
    # @option params [Integer] :expires_in_hours Horas que la liga sirve, de 1 a 168 (7 días).
    # @option params [Boolean] :keep_efirma true para que la página también guarde (cifrada) la e.firma de su cliente, con su autorización, y pueda pedir…
    # @option params [Boolean] :efirma_only true para pedir solo la e.firma, sin el CSD: para consultar el SAT por su cliente sin timbrar por él.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_onboarding_link(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/onboarding_links", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver la opinión de cumplimiento (32-D)
    #
    # La última opinión que trajo del SAT: positiva, negativa (con sus motivos), sin obligaciones o en suspensión. result es null hasta la primera consulta. No usa timbres.
    #
    # GET /v1/issuers/{id}/compliance_opinion
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-compliance-opinion
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def compliance_opinion(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/compliance_opinion", nil, opts, kw)
    end

    # Pedir la opinión de cumplimiento al SAT
    #
    # La pide al SAT con la e.firma guardada del emisor (POST /v1/issuers/{id}/efirma con keep_for_downloads: true); llega a GET /v1/issuers/{id}/compliance_opinion. 1 timbre en producción, una vez cada 10 minutos. Contesta 202 en cuanto la acepta (status processing) y consulta al SAT en segundo plano: sat_refresh.completed o sat_refresh.failed dicen cómo terminó, y GET /v1/sat_refreshes/{id} también. Su timbre se aparta al aceptarla (sin timbres contesta 402 de inmediato), se usa cuando el SAT contesta y regresa si no contesta. En pruebas da una positiva de ejemplo al instante (la consulta ya viene completed y también llega sat_refresh.completed).
    #
    # POST /v1/issuers/{id}/compliance_opinion/refresh
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/refresh-compliance-opinion
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def refresh_compliance_opinion(id, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/compliance_opinion/refresh", nil, opts, kw, idempotent: true)
    end

    # Descargar el PDF de la opinión de cumplimiento
    #
    # El PDF de la última opinión, como lo da el SAT. No usa timbres.
    #
    # GET /v1/issuers/{id}/compliance_opinion/pdf
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-compliance-opinion-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def compliance_opinion_pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/compliance_opinion/pdf", nil, opts, kw, result: :bytes)
    end

    # Ver la constancia de situación fiscal
    #
    # Lo que dice la última constancia generada: razón social, regímenes, código postal, estatus en el padrón e idCIF. No usa timbres.
    #
    # GET /v1/issuers/{id}/tax_status_certificate
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-tax-status-certificate
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def tax_status_certificate(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/tax_status_certificate", nil, opts, kw)
    end

    # Generar la constancia de situación fiscal en el SAT
    #
    # Genera una constancia nueva con la e.firma guardada del emisor; llega a GET /v1/issuers/{id}/tax_status_certificate. 1 timbre en producción, una vez cada 10 minutos. Contesta 202 en cuanto la acepta (status processing) y consulta al SAT en segundo plano: sat_refresh.completed o sat_refresh.failed dicen cómo terminó, y GET /v1/sat_refreshes/{id} también. Su timbre se aparta al aceptarla (sin timbres contesta 402 de inmediato), se usa cuando el SAT contesta y regresa si no contesta. En pruebas hace una con los datos del emisor al instante.
    #
    # POST /v1/issuers/{id}/tax_status_certificate/refresh
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/refresh-tax-status-certificate
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def refresh_tax_status_certificate(id, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/tax_status_certificate/refresh", nil, opts, kw, idempotent: true)
    end

    # Descargar el PDF de la constancia
    #
    # El PDF de la última constancia, como lo da el SAT. No usa timbres.
    #
    # GET /v1/issuers/{id}/tax_status_certificate/pdf
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-tax-status-certificate-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def tax_status_certificate_pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/tax_status_certificate/pdf", nil, opts, kw, result: :bytes)
    end

    # Revisar el buzón tributario en el SAT
    #
    # Lee los avisos del buzón tributario del emisor con su e.firma guardada; nunca abre notificaciones (abrirlas firma el acuse y corren los plazos). Llegan a GET /v1/sat_mailbox_messages. 1 timbre en producción, una vez cada 10 minutos. Contesta 202 en cuanto la acepta (status processing) y consulta al SAT en segundo plano: sat_refresh.completed o sat_refresh.failed dicen cómo terminó, y GET /v1/sat_refreshes/{id} también. Su timbre se aparta al aceptarla (sin timbres contesta 402 de inmediato), se usa cuando el SAT contesta y regresa si no contesta. En pruebas deja dos avisos de ejemplo al instante.
    #
    # POST /v1/issuers/{id}/sat_mailbox/refresh
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/refresh-sat-mailbox
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def refresh_sat_mailbox(id, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/sat_mailbox/refresh", nil, opts, kw, idempotent: true)
    end

    # Ver el portal de autofactura de un emisor
    #
    # El portal de autofactura del emisor: su dirección, hasta cuándo se puede facturar un ticket y cómo se arma la factura global.
    #
    # GET /v1/issuers/{id}/self_invoicing
    # https://fiscalisto.com/docs/api/referencia/autofactura/get-self-invoicing
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get_self_invoicing(id, opts = nil, **kw)
      @client.call("GET", "/v1/issuers/#{Core.path(id)}/self_invoicing", nil, opts, kw)
    end

    # Cambiar las reglas de autofactura
    #
    # Hasta cuándo se puede facturar un ticket y cada cuánto se timbra la factura global.
    #
    # POST /v1/issuers/{id}/self_invoicing
    # https://fiscalisto.com/docs/api/referencia/autofactura/update-self-invoicing
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :window Hasta cuándo se puede facturar un ticket: `month`, hasta el fin del mes de la venta (lo usual ante el SAT); `…
    # @option params [Integer] :window_days Días para facturar con `window: days`.
    # @option params [String] :global_periodicity c_Periodicidad de la factura global con los tickets que nadie facturó: 01 diaria, 02 semanal o 04 mensual (re…
    # @option params [String] :global_invoice `auto` (por omisión): los tickets que nadie facturó van solos a la factura global al terminar su periodo.
    # @option params [Boolean] :ask_total `true` (por omisión): el comprador busca su ticket con el código y el total.
    # @option params [String] :portal_title El título del portal, en lugar de «Facture su ticket».
    # @option params [String] :portal_message Un mensaje bajo el título (instrucciones, horario, a quién escribir).
    # @option params [String] :code_hint Dónde encuentra el comprador su código, bajo el campo («Viene en su correo de salida»).
    # @option params [String] :portal_theme El tema del portal: `auto` (por omisión), el del dispositivo del comprador, que puede cambiarlo; `light` o `d…
    # @option params [String] :portal_accent El color de los botones del portal, como `#0b7c77`.
    # @option params [Integer] :portal_radius Lo redondo de las esquinas del portal, en píxeles (0 a 24).
    # @option params [Hash] :portal_style Todo lo demás de cómo se ve el portal (Autofactura › Cómo se ve el portal): acomodo, encabezado, colores, let…
    # @option params [String] :retention_mode Cuando se factura una persona moral y retiene (1.25% de ISR a un emisor en RESICO, artículo 113-J de la LISR,…
    # @option params [String] :invoice_series La serie de las facturas que los compradores se hacen en el portal (y las que se emiten desde un ticket), com…
    # @option params [Boolean] :customer_notes `true`: el portal le pide al comprador una nota para el PDF de su factura (hasta 500 caracteres; Autofactura…
    # @option params [Boolean] :failure_email `true` (por omisión): cuando un comprador no puede facturar por algo del emisor (su CSD, sus datos, el PAC),…
    # @option params [Integer] :split_max Dividir un ticket en varias facturas (Autofactura › Reglas de los tickets): cuántas facturas puede tener un t…
    # @option params [Numeric] :split_min Lo menos que puede ser cada factura de un ticket dividido, con impuestos (por omisión 100).
    # @option params [Boolean] :split_same `true` (por omisión): un comprador puede hacerse varias facturas con los mismos datos de una vez (4 de 250 de…
    # @option params [Hash] :invoice_concepts Los conceptos de la factura que se hace el comprador (Autofactura › Conceptos de la factura): desglosados o e…
    # @option params [String] :global_concepts Los conceptos de la factura global: `ticket` (por omisión), uno «Venta» por ticket con su folio como `NoIdent…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_self_invoicing(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/issuers/#{Core.path(id)}/self_invoicing", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Emisores: fiscalisto.schedule_settings.
  class ScheduleSettingsResource
    def initialize(client)
      @client = client
    end

    # Ver los horarios
    #
    # Los horarios de la empresa, como Ajustes › Horarios en la app: cuántos días vale una cotización nueva y a qué hora vence, y a qué hora corren las reglas «Cada mañana», la revisión diaria de hallazgos y el resumen semanal de los lunes, todo en su zona horaria (time_zone). Valen para toda la empresa: cualquiera de sus emisores lee los mismos.
    #
    # GET /v1/schedule_settings
    # https://fiscalisto.com/docs/api/referencia/emisores/get-schedule-settings
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/schedule_settings", params, opts, kw, send: :query)
    end

    # Cambiar los horarios
    #
    # Cambia los horarios de la empresa (para todos sus emisores). Lo que no mande se queda como está. Un cliente o su grupo pueden tener su propia vigencia de cotizaciones (quote_valid_days), que gana a la de la empresa.
    #
    # POST /v1/schedule_settings
    # https://fiscalisto.com/docs/api/referencia/emisores/update-schedule-settings
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Integer] :quote_valid_days Días que vale una cotización nueva, de 1 a 366.
    # @option params [Integer] :quote_expiry_hour A qué hora (0 a 23) vence una cotización su último día; null: al terminar ese día, a medianoche.
    # @option params [Integer] :rules_hour A qué hora (0 a 23) corren las reglas «Cada mañana» (triggers invoice.daily y purchase_order.daily).
    # @option params [Integer] :findings_hour A qué hora (0 a 23) corre la revisión diaria de hallazgos.
    # @option params [Integer] :digest_hour A qué hora (0 a 23) del lunes sale el resumen semanal por correo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/schedule_settings", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Emisores: fiscalisto.setting_changes.
  class SettingChangesResource
    def initialize(client)
      @client = client
    end

    # Listar los cambios a los ajustes
    #
    # Como Ajustes › Cambios en la app: cada ajuste de la empresa que alguien cambió (por ahora la cobranza automática y los horarios), de qué a qué, quién, por dónde y cuándo, del más reciente al más antiguo. Valen para toda la empresa: cualquiera de sus emisores lee los mismos.
    #
    # GET /v1/setting_changes
    # https://fiscalisto.com/docs/api/referencia/emisores/list-setting-changes
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :setting Solo los de este ajuste, por ejemplo cobranza.dias-credito.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/setting_changes", params, opts, kw)
    end

    # Deshacer un cambio a un ajuste
    #
    # Regresa el ajuste al valor que tenía antes de ese cambio, como «Deshacer» en la app, y devuelve el cambio nuevo que eso hizo (que también se puede deshacer). Solo el cambio más reciente de cada ajuste y mientras conserve el valor que dejó: si no, 400 setting_change_not_undoable.
    #
    # POST /v1/setting_changes/{id}/undo
    # https://fiscalisto.com/docs/api/referencia/emisores/undo-setting-change
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def undo(id, opts = nil, **kw)
      @client.call("POST", "/v1/setting_changes/#{Core.path(id)}/undo", nil, opts, kw, idempotent: true)
    end
  end

  # Facturas: fiscalisto.invoices.
  class InvoicesResource
    def initialize(client)
      @client = client
    end

    # Timbrar una factura
    #
    # Revisa la factura con las reglas del SAT, la sella y la timbra en una sola llamada. Responde con la factura timbrada (status valid) o, si el PAC tarda o el SAT no responde, 202 en processing: Fiscalisto la reintenta sola y invoice.stamped avisa. Con async: true responde 202 de inmediato y timbra después. Lo que puede omitir tiene el valor usual: PUE, MXN, uso G03 (S01 con régimen 616), objeto de impuesto 02, IVA 16%, cantidad 1, unidad E48.
    #
    # POST /v1/invoices
    # https://fiscalisto.com/docs/api/referencia/facturas/create-invoice
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :branch Sucursal (brn_…) desde donde se factura: su código postal va en LugarExpedicion, su dirección en el PDF y, si…
    # @option params [String] :cost_center Su centro de costo (ccn_…): la obra, proyecto, sucursal o área a la que pertenece, para ver ingresos y gastos…
    # @option params [String] :warehouse Almacén (whs_…) de donde salen sus productos con track_stock.
    # @option params [String] :customer El cliente (Receptor): el id de uno de su catálogo (cus_…) o sus datos.
    # @option params [Array] :items (obligatorio) Conceptos (Conceptos), al menos uno.
    # @option params [String] :type I ingreso (por omisión; con global, factura global) o T traslado.
    # @option params [Hash] :carta_porte Complemento Carta Porte 3.1 (traslado de mercancías).
    # @option params [String] :carta_porte_exemption Solo en un traslado (type T) sin carta_porte: la regla de la RMF 2026 que lo permite.
    # @option params [Hash] :ine Complemento INE (procesos electorales).
    # @option params [Array] :leyendas Complemento de leyendas fiscales.
    # @option params [Hash] :donation Complemento de donatarias: un recibo de donativo.
    # @option params [Array] :local_taxes Impuestos locales (complemento implocal): traslados y retenciones estatales.
    # @option params [String] :export Exportación (Exportacion), c_Exportacion: 01 no aplica (por omisión), 02 definitiva con clave A1 (lleva comer…
    # @option params [Hash] :comercio_exterior Complemento de comercio exterior 2.0.
    # @option params [Hash] :global Factura global a público en general (InformacionGlobal): periodicidad, meses y año.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :payment_terms Condiciones de pago (CondicionesDePago), hasta 1,000 caracteres sin «|»: «Crédito a 30 días», «50 % anticipo».
    # @option params [String] :pdf_language Idioma del PDF: es (por omisión) o en.
    # @option params [Hash] :addenda Addenda del receptor (Walmart, Soriana…), con sus propios campos.
    # @option params [Hash] :related CFDI relacionados (CfdiRelacionados): tipo de relación de c_TipoRelacion y los UUID.
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [Integer] :folio Folio (Folio) de esta factura en vez del siguiente de la serie: ese número toma su lugar en la numeración.
    # @option params [Boolean] :continue_sequence Con un folio elegido: true para que los siguientes sigan desde ese número.
    # @option params [String] :date Fecha de emisión (Fecha) si no es ahora, AAAA-MM-DDTHH:MM:SS hora de la Ciudad de México: hasta 72 horas ante…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [Boolean] :draft Solo en POST /v1/invoices.
    # @option params [Boolean] :async Solo en POST /v1/invoices.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar facturas
    #
    # Las más recientes primero.
    #
    # GET /v1/invoices
    # https://fiscalisto.com/docs/api/referencia/facturas/list-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status valid, pending, canceled, rejected o processing; draft lista solo los borradores (sin él no salen).
    # @option params [String] :type I, E, P, T o N.
    # @option params [String] :customer RFC del cliente o su id (cus_…).
    # @option params [String] :payment_status Facturas de ingreso por lo que deben: unpaid, partial, open (unpaid o partial) o paid.
    # @option params [String] :date[gte] Con fecha del CFDI desde, incluido.
    # @option params [String] :date[gt] Con fecha del CFDI después de, sin incluirlo.
    # @option params [String] :date[lte] Con fecha del CFDI hasta, incluido.
    # @option params [String] :date[lt] Con fecha del CFDI antes de, sin incluirlo.
    # @option params [String] :cost_center Solo las de este centro de costo (ccn_…), o none para las que no tienen.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @option params [String] :created_gte Igual que created[gte]; se conserva por compatibilidad.
    # @option params [String] :created_lte Igual que created[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/invoices", params, opts, kw)
    end

    # Revisar una factura sin timbrar
    #
    # El mismo cuerpo y las mismas revisiones que POST /v1/invoices, sin timbrar ni usar timbres: devuelve la factura como se timbraría ahora (con los datos fiscales del emisor, el siguiente folio, el subtotal, los impuestos y el total que calcula Fiscalisto), los avisos (un cliente en las listas del SAT, un duplicado) y el XML sin sellar (unsigned_xml). Úsela para mostrar el total antes de cobrar o para validar en su sistema; si algo falla, invoice_invalid como al timbrar. No pide Idempotency-Key y sirve con una llave de solo lectura.
    #
    # POST /v1/invoices/preview
    # https://fiscalisto.com/docs/api/referencia/facturas/preview-invoice
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :branch Sucursal (brn_…) desde donde se factura: su código postal va en LugarExpedicion, su dirección en el PDF y, si…
    # @option params [String] :cost_center Su centro de costo (ccn_…): la obra, proyecto, sucursal o área a la que pertenece, para ver ingresos y gastos…
    # @option params [String] :warehouse Almacén (whs_…) de donde salen sus productos con track_stock.
    # @option params [String] :customer El cliente (Receptor): el id de uno de su catálogo (cus_…) o sus datos.
    # @option params [Array] :items (obligatorio) Conceptos (Conceptos), al menos uno.
    # @option params [String] :type I ingreso (por omisión; con global, factura global) o T traslado.
    # @option params [Hash] :carta_porte Complemento Carta Porte 3.1 (traslado de mercancías).
    # @option params [String] :carta_porte_exemption Solo en un traslado (type T) sin carta_porte: la regla de la RMF 2026 que lo permite.
    # @option params [Hash] :ine Complemento INE (procesos electorales).
    # @option params [Array] :leyendas Complemento de leyendas fiscales.
    # @option params [Hash] :donation Complemento de donatarias: un recibo de donativo.
    # @option params [Array] :local_taxes Impuestos locales (complemento implocal): traslados y retenciones estatales.
    # @option params [String] :export Exportación (Exportacion), c_Exportacion: 01 no aplica (por omisión), 02 definitiva con clave A1 (lleva comer…
    # @option params [Hash] :comercio_exterior Complemento de comercio exterior 2.0.
    # @option params [Hash] :global Factura global a público en general (InformacionGlobal): periodicidad, meses y año.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :payment_terms Condiciones de pago (CondicionesDePago), hasta 1,000 caracteres sin «|»: «Crédito a 30 días», «50 % anticipo».
    # @option params [String] :pdf_language Idioma del PDF: es (por omisión) o en.
    # @option params [Hash] :addenda Addenda del receptor (Walmart, Soriana…), con sus propios campos.
    # @option params [Hash] :related CFDI relacionados (CfdiRelacionados): tipo de relación de c_TipoRelacion y los UUID.
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [Integer] :folio Folio (Folio) de esta factura en vez del siguiente de la serie: ese número toma su lugar en la numeración.
    # @option params [Boolean] :continue_sequence Con un folio elegido: true para que los siguientes sigan desde ese número.
    # @option params [String] :date Fecha de emisión (Fecha) si no es ahora, AAAA-MM-DDTHH:MM:SS hora de la Ciudad de México: hasta 72 horas ante…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [Boolean] :draft Solo en POST /v1/invoices.
    # @option params [Boolean] :async Solo en POST /v1/invoices.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def preview(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/preview", params, opts, kw, send: :body, idempotent: true)
    end

    # Buscar facturas
    #
    # Con un lenguaje de búsqueda, como el de Stripe: campo:'valor' (igual, sin importar mayúsculas), campo~'valor' (contiene, 3 caracteres o más), >, >=, < y <= en números y fechas, -campo:'valor' (no) y campo:null; hasta 10 cláusulas unidas con AND o con OR. Se busca por customer (RFC), customer_name, uuid, series, folio, total, status (valid, pending, canceled, rejected o processing), created y metadata (metadata['order_id']:'123', con la llave entre corchetes). Los más recientes primero, por páginas como las listas. Una búsqueda que no se entiende responde search_query_invalid diciendo dónde.
    #
    # GET /v1/invoices/search
    # https://fiscalisto.com/docs/api/referencia/facturas/search-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :query (obligatorio) La búsqueda, por ejemplo customer:'URE180429TM6' AND total>1000 AND created>'2026-11-01'.
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def search(params = nil, opts = nil, **kw)
      @client.list_call("/v1/invoices/search", params, opts, kw)
    end

    # Ver una factura
    #
    # Por su id (inv_…) o por su folio fiscal (UUID). Un borrador responde con status draft; ya timbrado, su id responde con la factura timbrada (que tiene su propio id).
    #
    # GET /v1/invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/facturas/get-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @option params [Boolean] :refresh true para preguntar su estado al SAT ahora (cancelaciones en espera).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/invoices/#{Core.path(id)}", params, opts, kw, send: :query)
    end

    # Actualizar una factura o un borrador
    #
    # Un borrador (status draft) se cambia completo: mande la factura entera, con el mismo cuerpo y las mismas revisiones que POST /v1/invoices (un error responde invoice_invalid; los avisos vienen en warnings); metadata que no mande se queda como estaba. Si esperaba la aprobación de un administrador en Fiscalisto, la solicitud se retira. De una factura timbrada solo cambia lo que no toca el CFDI: su centro de costo (cost_center, o null para quitárselo; los complementos de pago y los traslados no llevan) y la nota para el cliente del PDF (notes, o null para quitarla; el XML no cambia y el siguiente PDF y correo ya la llevan).
    #
    # POST /v1/invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/facturas/update-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :branch Sucursal (brn_…) desde donde se factura: su código postal va en LugarExpedicion, su dirección en el PDF y, si…
    # @option params [String] :cost_center Su centro de costo (ccn_…): la obra, proyecto, sucursal o área a la que pertenece, para ver ingresos y gastos…
    # @option params [String] :warehouse Almacén (whs_…) de donde salen sus productos con track_stock.
    # @option params [String] :customer El cliente (Receptor): el id de uno de su catálogo (cus_…) o sus datos.
    # @option params [Array] :items Conceptos (Conceptos), al menos uno.
    # @option params [String] :type I ingreso (por omisión; con global, factura global) o T traslado.
    # @option params [Hash] :carta_porte Complemento Carta Porte 3.1 (traslado de mercancías).
    # @option params [String] :carta_porte_exemption Solo en un traslado (type T) sin carta_porte: la regla de la RMF 2026 que lo permite.
    # @option params [Hash] :ine Complemento INE (procesos electorales).
    # @option params [Array] :leyendas Complemento de leyendas fiscales.
    # @option params [Hash] :donation Complemento de donatarias: un recibo de donativo.
    # @option params [Array] :local_taxes Impuestos locales (complemento implocal): traslados y retenciones estatales.
    # @option params [String] :export Exportación (Exportacion), c_Exportacion: 01 no aplica (por omisión), 02 definitiva con clave A1 (lleva comer…
    # @option params [Hash] :comercio_exterior Complemento de comercio exterior 2.0.
    # @option params [Hash] :global Factura global a público en general (InformacionGlobal): periodicidad, meses y año.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :payment_terms Condiciones de pago (CondicionesDePago), hasta 1,000 caracteres sin «|»: «Crédito a 30 días», «50 % anticipo».
    # @option params [String] :pdf_language Idioma del PDF: es (por omisión) o en.
    # @option params [Hash] :addenda Addenda del receptor (Walmart, Soriana…), con sus propios campos.
    # @option params [Hash] :related CFDI relacionados (CfdiRelacionados): tipo de relación de c_TipoRelacion y los UUID.
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [Integer] :folio Folio (Folio) de esta factura en vez del siguiente de la serie: ese número toma su lugar en la numeración.
    # @option params [Boolean] :continue_sequence Con un folio elegido: true para que los siguientes sigan desde ese número.
    # @option params [String] :date Fecha de emisión (Fecha) si no es ahora, AAAA-MM-DDTHH:MM:SS hora de la Ciudad de México: hasta 72 horas ante…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [Boolean] :draft Solo en POST /v1/invoices.
    # @option params [Boolean] :async Solo en POST /v1/invoices.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un borrador
    #
    # Borra un borrador (status draft), hecho con la API o en Fiscalisto. Una factura timbrada no se borra: responde invoice_not_draft; cancélela con POST /v1/invoices/{id}/cancel.
    #
    # DELETE /v1/invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/facturas/delete-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/invoices/#{Core.path(id)}", nil, opts, kw)
    end

    # Timbrar un borrador
    #
    # Timbra un borrador tal como está guardado (no lleva cuerpo; cámbielo antes con POST /v1/invoices/{id}), con las mismas revisiones y respuestas que POST /v1/invoices: 201 timbrada, o 202 en processing si el PAC tarda. Pide Idempotency-Key; además, un borrador se timbra una sola vez aunque lo timbren a la vez desde la API y desde Fiscalisto. Ya timbrado, responde con esa factura. Uno que espera la aprobación de un administrador responde draft_awaiting_approval.
    #
    # POST /v1/invoices/{id}/stamp
    # https://fiscalisto.com/docs/api/referencia/facturas/stamp-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def stamp(id, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}/stamp", nil, opts, kw, idempotent: true)
    end

    # Descargar el PDF
    #
    # La representación impresa del CFDI, como la recibe su cliente. En vez del id puede usar el UUID (con issuer si la cuenta tiene varios emisores).
    #
    # GET /v1/invoices/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/facturas/get-invoice-pdf
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/invoices/#{Core.path(id)}/pdf", params, opts, kw, send: :query, result: :bytes)
    end

    # Descargar el XML
    #
    # El CFDI timbrado, tal como lo tiene el SAT.
    #
    # GET /v1/invoices/{id}/xml
    # https://fiscalisto.com/docs/api/referencia/facturas/get-invoice-xml
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def xml(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/invoices/#{Core.path(id)}/xml", params, opts, kw, send: :query, result: :text)
    end

    # Descargar el acuse de cancelación
    #
    # El acuse de cancelación del SAT (XML firmado por el SAT) de una factura cancelada: la prueba de que el SAT la canceló y cuándo. Antes de que el SAT la cancele (status valid o pending), 409 invoice_not_canceled.
    #
    # GET /v1/invoices/{id}/cancellation_receipt
    # https://fiscalisto.com/docs/api/referencia/facturas/get-invoice-cancellation-receipt
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancellation_receipt(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/invoices/#{Core.path(id)}/cancellation_receipt", params, opts, kw, send: :query, result: :text)
    end

    # Enviar por correo
    #
    # Manda el PDF y el XML con el diseño de Fiscalisto. Sin `to`, al correo del cliente. Con la misma Idempotency-Key no se manda dos veces.
    #
    # POST /v1/invoices/{id}/send
    # https://fiscalisto.com/docs/api/referencia/facturas/send-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :to A quién (correos separados por comas).
    # @option params [String] :cc Con copia (correos separados por comas).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def send(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}/send", params, opts, kw, send: :body, idempotent: true)
    end

    # Cancelar una factura
    #
    # Pide la cancelación al SAT. Si el cliente debe aceptarla queda en pending (escuche invoice.canceled o invoice.cancellation_rejected). No usa timbres. El SAT registra cada comprobante unos minutos después de timbrarlo: si lo cancela antes, contesta 409 cancellation_too_early con Retry-After; repita la misma solicitud.
    #
    # POST /v1/invoices/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/facturas/cancel-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :motive Motivo de cancelación (c_MotivoCancelacion): 01 con errores con relación (lleva substitution), 02 con errores…
    # @option params [String] :substitution El comprobante que sustituye a este (su id o su UUID), con el motivo 01.
    # @option params [Boolean] :notify_customer true para avisarle al cliente por correo que se canceló, con el diseño de Fiscalisto, a las direcciones a las…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}/cancel", params, opts, kw, send: :body, idempotent: true)
    end

    # Sustituir una factura
    #
    # Timbra la factura corregida (el mismo cuerpo que POST /v1/invoices, relacionada 04) y cancela la anterior con motivo 01.
    #
    # POST /v1/invoices/{id}/substitute
    # https://fiscalisto.com/docs/api/referencia/facturas/substitute-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :branch Sucursal (brn_…) desde donde se factura: su código postal va en LugarExpedicion, su dirección en el PDF y, si…
    # @option params [String] :cost_center Su centro de costo (ccn_…): la obra, proyecto, sucursal o área a la que pertenece, para ver ingresos y gastos…
    # @option params [String] :warehouse Almacén (whs_…) de donde salen sus productos con track_stock.
    # @option params [String] :customer El cliente (Receptor): el id de uno de su catálogo (cus_…) o sus datos.
    # @option params [Array] :items (obligatorio) Conceptos (Conceptos), al menos uno.
    # @option params [String] :type I ingreso (por omisión; con global, factura global) o T traslado.
    # @option params [Hash] :carta_porte Complemento Carta Porte 3.1 (traslado de mercancías).
    # @option params [String] :carta_porte_exemption Solo en un traslado (type T) sin carta_porte: la regla de la RMF 2026 que lo permite.
    # @option params [Hash] :ine Complemento INE (procesos electorales).
    # @option params [Array] :leyendas Complemento de leyendas fiscales.
    # @option params [Hash] :donation Complemento de donatarias: un recibo de donativo.
    # @option params [Array] :local_taxes Impuestos locales (complemento implocal): traslados y retenciones estatales.
    # @option params [String] :export Exportación (Exportacion), c_Exportacion: 01 no aplica (por omisión), 02 definitiva con clave A1 (lleva comer…
    # @option params [Hash] :comercio_exterior Complemento de comercio exterior 2.0.
    # @option params [Hash] :global Factura global a público en general (InformacionGlobal): periodicidad, meses y año.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :payment_terms Condiciones de pago (CondicionesDePago), hasta 1,000 caracteres sin «|»: «Crédito a 30 días», «50 % anticipo».
    # @option params [String] :pdf_language Idioma del PDF: es (por omisión) o en.
    # @option params [Hash] :addenda Addenda del receptor (Walmart, Soriana…), con sus propios campos.
    # @option params [Hash] :related CFDI relacionados (CfdiRelacionados): tipo de relación de c_TipoRelacion y los UUID.
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [Integer] :folio Folio (Folio) de esta factura en vez del siguiente de la serie: ese número toma su lugar en la numeración.
    # @option params [Boolean] :continue_sequence Con un folio elegido: true para que los siguientes sigan desde ese número.
    # @option params [String] :date Fecha de emisión (Fecha) si no es ahora, AAAA-MM-DDTHH:MM:SS hora de la Ciudad de México: hasta 72 horas ante…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [Boolean] :draft Solo en POST /v1/invoices.
    # @option params [Boolean] :async Solo en POST /v1/invoices.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def substitute(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}/substitute", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar pagada
    #
    # Una factura PUE timbrada con paid_later (o marcada por cobrar) ya se pagó: queda paid, con paid_on el día que indique (hoy si no), y llega invoice.paid. Una PPD se paga con su complemento de pago (POST /v1/payments).
    #
    # POST /v1/invoices/{id}/mark_paid
    # https://fiscalisto.com/docs/api/referencia/cuentas-por-cobrar/mark-invoice-paid
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :paid_on El día en que el cliente pagó (AAAA-MM-DD, no antes de la factura ni después de hoy); hoy si no se indica.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_paid(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}/mark_paid", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar por cobrar
    #
    # Una factura PUE que el cliente aún no paga (le paga este mes): queda unpaid hasta POST /v1/invoices/{id}/mark_paid. Si el mes termina sin pago, la ley pide sustituirla por una PPD (regla 2.7.1.39 de la RMF).
    #
    # POST /v1/invoices/{id}/mark_unpaid
    # https://fiscalisto.com/docs/api/referencia/cuentas-por-cobrar/mark-invoice-unpaid
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_unpaid(id, opts = nil, **kw)
      @client.call("POST", "/v1/invoices/#{Core.path(id)}/mark_unpaid", nil, opts, kw, idempotent: true)
    end
  end

  # Cuentas por cobrar: fiscalisto.receivables.
  class ReceivablesResource
    def initialize(client)
      @client = client
    end

    # Ver lo que le deben
    #
    # Lo que debe cada cliente, por moneda, de sus facturas abiertas (PPD con saldo y PUE por cobrar), ordenado por RFC. Las facturas de cada uno: GET /v1/invoices?customer=RFC&payment_status=open.
    #
    # GET /v1/receivables
    # https://fiscalisto.com/docs/api/referencia/cuentas-por-cobrar/list-receivables
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :customer Solo este cliente: su RFC o su id (cus_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/receivables", params, opts, kw)
    end
  end

  # Cuentas por cobrar: fiscalisto.customers.
  class CustomersResource
    def initialize(client)
      @client = client
    end

    # Ver cómo paga un cliente
    #
    # Cuántos días tarda en pagar, qué parte llega a tiempo con sus días de crédito, si paga más lento que antes, cómo le paga y cuándo le llegaría lo que debe. De sus facturas a crédito (PPD) de los últimos 12 meses y sus complementos de pago, como «Cómo paga» en la app. No aplica a XAXX010101000 ni XEXX010101000.
    #
    # GET /v1/customers/{id}/payment_behavior
    # https://fiscalisto.com/docs/api/referencia/cuentas-por-cobrar/get-customer-payment-behavior
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def payment_behavior(id, opts = nil, **kw)
      @client.call("GET", "/v1/customers/#{Core.path(id)}/payment_behavior", nil, opts, kw)
    end

    # Crear un cliente
    #
    # Un cliente del catálogo del emisor, con sus datos fiscales como vienen en su constancia. Un RFC que ya está en el catálogo contesta customer_exists.
    #
    # POST /v1/customers
    # https://fiscalisto.com/docs/api/referencia/clientes/create-customer
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :tax_id (obligatorio) RFC (Rfc), 12 caracteres una persona moral y 13 una física.
    # @option params [String] :legal_name (obligatorio) Nombre o razón social tal como está en la constancia de situación fiscal, sin el régimen de capital (sin «S.A.
    # @option params [String] :tax_system (obligatorio) Régimen fiscal (RegimenFiscal), clave de c_RegimenFiscal: 601, 612, 626…
    # @option params [String] :zip (obligatorio) Código postal del domicilio fiscal, 5 dígitos, como en la constancia de situación fiscal.
    # @option params [String] :email Correo del cliente (varios separados por comas), a donde van sus facturas con send_email.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [Hash] :foreign Si es extranjero: su país de residencia (ResidenciaFiscal, c_Pais) y su número de registro tributario (NumReg…
    # @option params [String] :group Su grupo de clientes (cgr_…), o null para ninguno.
    # @option params [String] :price_list Su propia lista de precios (prl_…), que gana sobre la de su grupo; null: la de su grupo o la de todos.
    # @option params [Numeric] :discount_percent Su propio descuento en cada concepto, en %; null: el de su grupo.
    # @option params [Boolean] :ieps_taxpayer true si el cliente es contribuyente de IEPS: el IEPS va desglosado en vez de sumado al precio, salvo el del a…
    # @option params [Integer] :credit_days Sus días de crédito: sus facturas vencen estos días después de su fecha (due_date, cobranza); null: los de su…
    # @option params [Integer] :quote_valid_days Días que vale una cotización nueva para este cliente (valid_until); null: los de su grupo o los de la empresa…
    # @option params [String] :payment_terms Sus condiciones de pago («Crédito a 30 días»): las facturas nuevas en la app empiezan con ellas; null: las de…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/customers", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar clientes
    #
    # Los clientes del emisor, los más recientes primero. Con tax_id, el de ese RFC.
    #
    # GET /v1/customers
    # https://fiscalisto.com/docs/api/referencia/clientes/list-customers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :tax_id Solo el de este RFC.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/customers", params, opts, kw)
    end

    # Buscar clientes
    #
    # Con un lenguaje de búsqueda, como el de Stripe: campo:'valor' (igual, sin importar mayúsculas), campo~'valor' (contiene, 3 caracteres o más), >, >=, < y <= en números y fechas, -campo:'valor' (no) y campo:null; hasta 10 cláusulas unidas con AND o con OR. Se busca por tax_id, legal_name, email, zip, tax_system, use, created y metadata (metadata['order_id']:'123', con la llave entre corchetes). Los más recientes primero, por páginas como las listas. Una búsqueda que no se entiende responde search_query_invalid diciendo dónde.
    #
    # GET /v1/customers/search
    # https://fiscalisto.com/docs/api/referencia/clientes/search-customers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :query (obligatorio) La búsqueda, por ejemplo legal_name~'robotica' AND zip:'86991'.
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def search(params = nil, opts = nil, **kw)
      @client.list_call("/v1/customers/search", params, opts, kw)
    end

    # Ver un cliente
    #
    # Un cliente del catálogo.
    #
    # GET /v1/customers/{id}
    # https://fiscalisto.com/docs/api/referencia/clientes/get-customer
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/customers/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un cliente
    #
    # Cambia solo los campos que manda. Las facturas ya timbradas no cambian.
    #
    # POST /v1/customers/{id}
    # https://fiscalisto.com/docs/api/referencia/clientes/update-customer
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :tax_id RFC (Rfc), 12 caracteres una persona moral y 13 una física.
    # @option params [String] :legal_name Nombre o razón social tal como está en la constancia de situación fiscal, sin el régimen de capital (sin «S.A.
    # @option params [String] :tax_system Régimen fiscal (RegimenFiscal), clave de c_RegimenFiscal: 601, 612, 626…
    # @option params [String] :zip Código postal del domicilio fiscal, 5 dígitos, como en la constancia de situación fiscal.
    # @option params [String] :email Correo del cliente (varios separados por comas), a donde van sus facturas con send_email.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [Hash] :foreign Si es extranjero: su país de residencia (ResidenciaFiscal, c_Pais) y su número de registro tributario (NumReg…
    # @option params [String] :group Su grupo de clientes (cgr_…), o null para ninguno.
    # @option params [String] :price_list Su propia lista de precios (prl_…), que gana sobre la de su grupo; null: la de su grupo o la de todos.
    # @option params [Numeric] :discount_percent Su propio descuento en cada concepto, en %; null: el de su grupo.
    # @option params [Boolean] :ieps_taxpayer true si el cliente es contribuyente de IEPS: el IEPS va desglosado en vez de sumado al precio, salvo el del a…
    # @option params [Integer] :credit_days Sus días de crédito: sus facturas vencen estos días después de su fecha (due_date, cobranza); null: los de su…
    # @option params [Integer] :quote_valid_days Días que vale una cotización nueva para este cliente (valid_until); null: los de su grupo o los de la empresa…
    # @option params [String] :payment_terms Sus condiciones de pago («Crédito a 30 días»): las facturas nuevas en la app empiezan con ellas; null: las de…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/customers/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un cliente
    #
    # Lo quita del catálogo. Sus facturas timbradas siguen igual.
    #
    # DELETE /v1/customers/{id}
    # https://fiscalisto.com/docs/api/referencia/clientes/delete-customer
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/customers/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Flujo de efectivo: fiscalisto.cash_forecast.
  class CashForecastResource
    def initialize(client)
      @client = client
    end

    # Ver el flujo de efectivo
    #
    # Las próximas 13 semanas del emisor, como «Flujo de efectivo» en la app: lo que le deben, con lo que cada cliente suele tardar en pagar; lo que debe a proveedores; la nómina; las declaraciones mensuales; las facturas recurrentes y sus movimientos previstos, desde el saldo que dio. Trae avisos con lo que puede hacer, y con los parámetros, un escenario (no se guarda). Una estimación: nada cambia solo.
    #
    # GET /v1/cash_forecast
    # https://fiscalisto.com/docs/api/referencia/flujo-de-efectivo/get-cash-forecast
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :customers_pay_days_later Escenario: sus clientes le pagan estos días después (0 a 120).
    # @option params [Integer] :pay_suppliers_days_later Escenario: usted paga a sus proveedores estos días después (0 a 120).
    # @option params [Boolean] :include_doubtful true cuenta lo que lleva más de 90 días de atraso (por omisión no).
    # @option params [Boolean] :include_recurring false deja fuera las facturas recurrentes que aún no se emiten.
    # @option params [Integer] :recurring_sales_change Escenario: por ciento que cambian sus recurrentes (−100 a 100).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/cash_forecast", params, opts, kw, send: :query)
    end

    # Dar el saldo de hoy
    #
    # El saldo de hoy en sus cuentas de banco (de donde parte el flujo) y lo menos que quiere tener. Solo lo que mande cambia. Responde el flujo con el saldo nuevo.
    #
    # POST /v1/cash_forecast
    # https://fiscalisto.com/docs/api/referencia/flujo-de-efectivo/update-cash-forecast
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [Hash] :starting_balance El saldo de hoy en sus cuentas de banco; null lo quita.
    # @option params [Numeric] :minimum_balance Lo menos que quiere tener: cada semana debajo trae un aviso.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cash_forecast", params, opts, kw, send: :body, idempotent: true)
    end

    # Agregar un movimiento previsto
    #
    # Algo que espera pagar o cobrar y que ninguna factura dice: una renta, un crédito, una venta de contado. Una vez o cada semana, dos semanas o mes. Hasta 200.
    #
    # POST /v1/cash_forecast/planned_items
    # https://fiscalisto.com/docs/api/referencia/flujo-de-efectivo/create-cash-forecast-item
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :description (obligatorio) Qué es: «Renta», «Crédito del banco».
    # @option params [String] :direction (obligatorio) inflow si es dinero que entra; outflow si sale.
    # @option params [Numeric] :amount (obligatorio) Cuánto, en pesos.
    # @option params [String] :date (obligatorio) El día (o la primera vez, si se repite).
    # @option params [String] :frequency once (por omisión), weekly, biweekly (cada dos semanas) o monthly.
    # @option params [String] :until El último día en que se repite; null sin fin.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_item(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cash_forecast/planned_items", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar un movimiento previsto
    #
    # Solo lo que mande cambia.
    #
    # POST /v1/cash_forecast/planned_items/{id}
    # https://fiscalisto.com/docs/api/referencia/flujo-de-efectivo/update-cash-forecast-item
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :description Qué es: «Renta», «Crédito del banco».
    # @option params [String] :direction inflow si es dinero que entra; outflow si sale.
    # @option params [Numeric] :amount Cuánto, en pesos.
    # @option params [String] :date El día (o la primera vez, si se repite).
    # @option params [String] :frequency once (por omisión), weekly, biweekly (cada dos semanas) o monthly.
    # @option params [String] :until El último día en que se repite; null sin fin.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_item(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cash_forecast/planned_items/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un movimiento previsto
    #
    # Ya no cuenta en el flujo.
    #
    # DELETE /v1/cash_forecast/planned_items/{id}
    # https://fiscalisto.com/docs/api/referencia/flujo-de-efectivo/delete-cash-forecast-item
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_item(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/cash_forecast/planned_items/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un renglón del flujo
    #
    # Otro día o monto para un renglón (lines[].line), o no contarlo: un cliente le avisó que paga después, o una factura ya se pagó por fuera. Solo cambia el pronóstico, nunca la factura. reset: true lo regresa a lo estimado. Responde el flujo con el cambio.
    #
    # POST /v1/cash_forecast/adjustments
    # https://fiscalisto.com/docs/api/referencia/flujo-de-efectivo/adjust-cash-forecast
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :line (obligatorio) El renglón (lines[].line de GET /v1/cash_forecast).
    # @option params [String] :date Otro día para ese renglón; null el estimado.
    # @option params [Numeric] :amount Otro monto, en pesos; null el estimado.
    # @option params [Boolean] :excluded true para no contarlo.
    # @option params [String] :note Por qué (lo ve quien abra la semana en la app).
    # @option params [Boolean] :reset true lo regresa a lo estimado; lo demás se ignora.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def adjust(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cash_forecast/adjustments", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Conciliación bancaria: fiscalisto.bank_transactions.
  class BankTransactionsResource
    def initialize(client)
      @client = client
    end

    # Mandar depósitos
    #
    # Los depósitos de la cuenta del emisor (de la API de su banco o de un estado de cuenta), hasta 1,000 por solicitud. Uno que ya mandó (mismo día, monto, referencia y concepto) se omite, así que puede mandar periodos que se enciman. Cada uno trae suggested_match: las facturas que parece pagar.
    #
    # POST /v1/bank_transactions
    # https://fiscalisto.com/docs/api/referencia/conciliacion-bancaria/create-bank-transactions
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :account La cuenta (CLABE o número; se guardan sus últimos 4 dígitos).
    # @option params [Array] :transactions (obligatorio) Los depósitos, hasta 1,000 por solicitud.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/bank_transactions", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar depósitos
    #
    # Los más recientes primero; los abiertos con su suggested_match.
    #
    # GET /v1/bank_transactions
    # https://fiscalisto.com/docs/api/referencia/conciliacion-bancaria/list-bank-transactions
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status open (sin conciliar), matched o classified.
    # @option params [String] :date[gte] Con fecha del movimiento desde, incluido.
    # @option params [String] :date[gt] Con fecha del movimiento después de, sin incluirlo.
    # @option params [String] :date[lte] Con fecha del movimiento hasta, incluido.
    # @option params [String] :date[lt] Con fecha del movimiento antes de, sin incluirlo.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/bank_transactions", params, opts, kw)
    end

    # Ver un depósito
    #
    # Un depósito mandado a conciliación, con las facturas que se le encontraron o el pago que se registró con él.
    #
    # GET /v1/bank_transactions/{id}
    # https://fiscalisto.com/docs/api/referencia/conciliacion-bancaria/get-bank-transaction
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/bank_transactions/#{Core.path(id)}", nil, opts, kw)
    end

    # Conciliar un depósito
    #
    # El depósito pagó estas facturas (de un mismo cliente), o sin invoices, las de suggested_match. Sus facturas PUE por cobrar quedan pagadas (invoice.paid). No timbra: para pagar una PPD con este depósito, POST /v1/payments con bank_transaction.
    #
    # POST /v1/bank_transactions/{id}/match
    # https://fiscalisto.com/docs/api/referencia/conciliacion-bancaria/match-bank-transaction
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :invoices Las facturas (inv_… o UUID) que pagó este depósito, de un mismo cliente.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def match(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/bank_transactions/#{Core.path(id)}/match", params, opts, kw, send: :body, idempotent: true)
    end

    # Explicar un depósito sin factura
    #
    # Un depósito que ninguna factura explica: venta (aún sin facturar), prestamo, traspaso, devolucion o intereses. El SAT puede presumir ingreso un depósito sin explicar (CFF art. 59 fr. III).
    #
    # POST /v1/bank_transactions/{id}/classify
    # https://fiscalisto.com/docs/api/referencia/conciliacion-bancaria/classify-bank-transaction
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :classification (obligatorio) venta (una venta que aún no se factura), prestamo, traspaso (entre cuentas propias), devolucion o intereses (…
    # @option params [String] :note Una nota para su equipo (de dónde vino, por qué).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def classify(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/bank_transactions/#{Core.path(id)}/classify", params, opts, kw, send: :body, idempotent: true)
    end

    # Deshacer la conciliación
    #
    # Vuelve a open, y sus facturas vuelven a deber. Si se pagó con un complemento vigente, cancélelo antes.
    #
    # POST /v1/bank_transactions/{id}/reopen
    # https://fiscalisto.com/docs/api/referencia/conciliacion-bancaria/reopen-bank-transaction
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reopen(id, opts = nil, **kw)
      @client.call("POST", "/v1/bank_transactions/#{Core.path(id)}/reopen", nil, opts, kw, idempotent: true)
    end
  end

  # Tickets de compra: fiscalisto.purchase_receipts.
  class PurchaseReceiptsResource
    def initialize(client)
      @client = client
    end

    # Guardar un ticket de compra
    #
    # La foto o el PDF de un ticket que el emisor pagó sin factura, en base64, con los datos que usted tenga: la tienda, su RFC, la fecha, el total, la forma de pago, el folio, los datos que pide su portal y la liga de facturación. Si qr_text es la liga de una tienda que factura con Fiscalisto, el folio y el total se llenan solos. El mismo archivo dos veces devuelve el ticket que ya estaba. Si llega una factura de esa tienda por el mismo total con las descargas del SAT, el ticket queda invoiced solo.
    #
    # POST /v1/purchase_receipts
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/create-purchase-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :file (obligatorio) La foto (JPG, PNG o WebP) o el PDF, en base64; hasta 8 MB.
    # @option params [String] :file_type (obligatorio) image/jpeg, image/png, image/webp o application/pdf.
    # @option params [String] :qr_text Lo que dice el código QR del ticket, si ya lo leyó (suele ser la liga del portal).
    # @option params [String] :store_name El nombre de la tienda.
    # @option params [String] :store_tax_id El RFC de la tienda (el que factura).
    # @option params [String] :date El día de la compra (AAAA-MM-DD).
    # @option params [Numeric] :total El total pagado, en pesos.
    # @option params [String] :payment_method efectivo, tarjeta u otro.
    # @option params [String] :folio El folio o número de ticket.
    # @option params [Array] :fields Otros datos que pide el portal de la tienda (Web ID, sucursal, caja…), hasta 8.
    # @option params [String] :portal_url La dirección del portal de facturación de la tienda (o la liga de autofactura de su QR).
    # @option params [String] :store_email El correo de facturación de la tienda.
    # @option params [String] :use El uso del CFDI (G03, I01…).
    # @option params [String] :note Una nota para su equipo.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/purchase_receipts", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar tickets de compra
    #
    # Los más recientes primero.
    #
    # GET /v1/purchase_receipts
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/list-purchase-receipts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status pending, requested, invoiced o non_deductible.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/purchase_receipts", params, opts, kw)
    end

    # Ver un ticket de compra
    #
    # Con la factura recibida que lo cubre, si ya llegó.
    #
    # GET /v1/purchase_receipts/{id}
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/get-purchase-receipt
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/purchase_receipts/#{Core.path(id)}", nil, opts, kw)
    end

    # Corregir un ticket de compra
    #
    # Corrige o llena sus datos; solo cambia lo que mande (null borra un dato). Con store_tax_id y total corregidos se vuelve a buscar su factura.
    #
    # POST /v1/purchase_receipts/{id}
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/update-purchase-receipt
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :store_name El nombre de la tienda.
    # @option params [String] :store_tax_id El RFC de la tienda (el que factura).
    # @option params [String] :date El día de la compra (AAAA-MM-DD).
    # @option params [Numeric] :total El total pagado, en pesos.
    # @option params [String] :payment_method efectivo, tarjeta u otro.
    # @option params [String] :folio El folio o número de ticket.
    # @option params [Array] :fields Otros datos que pide el portal de la tienda (Web ID, sucursal, caja…), hasta 8.
    # @option params [String] :portal_url La dirección del portal de facturación de la tienda (o la liga de autofactura de su QR).
    # @option params [String] :store_email El correo de facturación de la tienda.
    # @option params [String] :use El uso del CFDI (G03, I01…).
    # @option params [String] :note Una nota para su equipo.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/purchase_receipts/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un ticket de compra
    #
    # El ticket y su archivo, para siempre.
    #
    # DELETE /v1/purchase_receipts/{id}
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/delete-purchase-receipt
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/purchase_receipts/#{Core.path(id)}", nil, opts, kw)
    end

    # Pedir la factura a la tienda
    #
    # fiscalisto: la tienda factura con Fiscalisto (store.on_fiscalisto), se timbra al momento con los datos fiscales del emisor y el ticket queda invoiced. email: le manda a la tienda los datos fiscales y la foto; las respuestas van a reply_to. portal o manual: usted la pidió, solo queda requested. Pide el uso de use (G03 por omisión).
    #
    # POST /v1/purchase_receipts/{id}/request
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/request-purchase-receipt-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :method (obligatorio) fiscalisto (la tienda factura con Fiscalisto: se timbra al momento), email (le mandamos a la tienda sus datos…
    # @option params [String] :to email: el correo de la tienda.
    # @option params [String] :message email: unas líneas para la tienda.
    # @option params [String] :reply_to email y fiscalisto: el correo al que la tienda manda la factura.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def request_invoice(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/purchase_receipts/#{Core.path(id)}/request", params, opts, kw, send: :body, idempotent: true)
    end

    # Ya llegó la factura
    #
    # Para una factura que llegó por otro lado. Con invoice (sat_… o UUID), la factura recibida que lo cubre; una factura cubre un solo ticket.
    #
    # POST /v1/purchase_receipts/{id}/mark_invoiced
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/mark-purchase-receipt-invoiced
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :invoice La factura recibida que lo cubre: su id (sat_…) o su folio fiscal (UUID).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_invoiced(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/purchase_receipts/#{Core.path(id)}/mark_invoiced", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar como no deducible
    #
    # La tienda no dio factura: el gasto queda como no deducible.
    #
    # POST /v1/purchase_receipts/{id}/mark_non_deductible
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/mark-purchase-receipt-non-deductible
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_non_deductible(id, opts = nil, **kw)
      @client.call("POST", "/v1/purchase_receipts/#{Core.path(id)}/mark_non_deductible", nil, opts, kw, idempotent: true)
    end

    # Volver a pedir la factura
    #
    # Deshace mark_non_deductible o mark_invoiced: vuelve a requested si ya se había pedido, si no a pending.
    #
    # POST /v1/purchase_receipts/{id}/reopen
    # https://fiscalisto.com/docs/api/referencia/tickets-de-compra/reopen-purchase-receipt
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reopen(id, opts = nil, **kw)
      @client.call("POST", "/v1/purchase_receipts/#{Core.path(id)}/reopen", nil, opts, kw, idempotent: true)
    end
  end

  # Pagos y notas de crédito: fiscalisto.payments.
  class PaymentsResource
    def initialize(client)
      @client = client
    end

    # Timbrar un complemento de pago
    #
    # El recibo de pago (CFDI tipo P, Pagos 2.0) de facturas PPD: parcialidad, saldo anterior e insoluto e impuestos de cada una los calcula Fiscalisto.
    #
    # POST /v1/payments
    # https://fiscalisto.com/docs/api/referencia/pagos-y-notas-de-credito/create-payment
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :date Fecha en que le pagaron (FechaPago), AAAA-MM-DD.
    # @option params [String] :payment_form (obligatorio) Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :operation_number Número de operación del pago (NumOperacion), como el rastreo SPEI.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [Array] :documents (obligatorio) Las facturas que paga (DoctoRelacionado).
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email Correo a donde se envía (varios separados por comas).
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :bank_transaction El depósito (btx_…) con que le pagaron: queda conciliado con este complemento, y date es su día si no manda o…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payments", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Pagos y notas de crédito: fiscalisto.credit_notes.
  class CreditNotesResource
    def initialize(client)
      @client = client
    end

    # Timbrar una nota de crédito
    #
    # Un egreso (tipo E) relacionado 01 (o 03, devolución) a una factura, con su IVA y retenciones en la misma proporción. amount es antes de impuestos.
    #
    # POST /v1/credit_notes
    # https://fiscalisto.com/docs/api/referencia/pagos-y-notas-de-credito/create-credit-note
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :invoice (obligatorio) La factura (inv_… o su UUID).
    # @option params [Numeric] :amount (obligatorio) Importe de la nota antes de impuestos: Fiscalisto agrega el IVA y las retenciones de la factura en la misma p…
    # @option params [String] :description Descripción del concepto de la nota (Descripcion), como «Descuento por pronto pago».
    # @option params [String] :payment_form (obligatorio) Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :relationship Tipo de relación (TipoRelacion) con la factura: 01 nota de crédito (por omisión) o 03 devolución de mercancía.
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email Correo a donde se envía (varios separados por comas).
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/credit_notes", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Anticipos: fiscalisto.advances.
  class AdvancesResource
    def initialize(client)
      @client = client
    end

    # Timbrar un anticipo
    #
    # La factura del anticipo: un concepto «Anticipo del bien o servicio» (84111506, ACT). amount es lo que pagó el cliente con IVA.
    #
    # POST /v1/advances
    # https://fiscalisto.com/docs/api/referencia/anticipos/create-advance
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :customer (obligatorio) El cliente (Receptor): el id de uno de su catálogo (cus_…) o sus datos.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [Numeric] :amount (obligatorio) Lo que pagó el cliente, con IVA incluido.
    # @option params [String] :iva Tasa de IVA trasladado: "0.16" (por omisión), "0.08" (región fronteriza), "0" o "exento".
    # @option params [String] :payment_form (obligatorio) Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/advances", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar anticipos sin aplicar
    #
    # Los anticipos timbrados que todavía no se aplican a una factura, con lo que queda de cada uno. Filtre por customer para los de un cliente.
    #
    # GET /v1/advances
    # https://fiscalisto.com/docs/api/referencia/anticipos/list-advances
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :customer RFC del cliente o su id (cus_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/advances", params, opts, kw, send: :query)
    end

    # Aplicar un anticipo
    #
    # Timbra la factura de lo vendido (el cuerpo de POST /v1/invoices) relacionada 07 al anticipo. Con method egreso, también la nota de aplicación. La misma Idempotency-Key continúa donde se quedó.
    #
    # POST /v1/advances/{id}/apply
    # https://fiscalisto.com/docs/api/referencia/anticipos/apply-advance
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :method egreso (la factura completa y después una nota de crédito por el anticipo, opción A) o remanente (la factura…
    # @option params [Hash] :remainder Cómo se paga lo que falta del anticipo: ahora con su forma de pago, o después (PPD).
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :branch Sucursal (brn_…) desde donde se factura: su código postal va en LugarExpedicion, su dirección en el PDF y, si…
    # @option params [String] :cost_center Su centro de costo (ccn_…): la obra, proyecto, sucursal o área a la que pertenece, para ver ingresos y gastos…
    # @option params [String] :warehouse Almacén (whs_…) de donde salen sus productos con track_stock.
    # @option params [String] :customer El cliente (Receptor): el id de uno de su catálogo (cus_…) o sus datos.
    # @option params [Array] :items (obligatorio) Conceptos (Conceptos), al menos uno.
    # @option params [String] :type I ingreso (por omisión; con global, factura global) o T traslado.
    # @option params [Hash] :carta_porte Complemento Carta Porte 3.1 (traslado de mercancías).
    # @option params [String] :carta_porte_exemption Solo en un traslado (type T) sin carta_porte: la regla de la RMF 2026 que lo permite.
    # @option params [Hash] :ine Complemento INE (procesos electorales).
    # @option params [Array] :leyendas Complemento de leyendas fiscales.
    # @option params [Hash] :donation Complemento de donatarias: un recibo de donativo.
    # @option params [Array] :local_taxes Impuestos locales (complemento implocal): traslados y retenciones estatales.
    # @option params [String] :export Exportación (Exportacion), c_Exportacion: 01 no aplica (por omisión), 02 definitiva con clave A1 (lleva comer…
    # @option params [Hash] :comercio_exterior Complemento de comercio exterior 2.0.
    # @option params [Hash] :global Factura global a público en general (InformacionGlobal): periodicidad, meses y año.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [String] :series Serie (Serie), hasta 25 caracteres.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :payment_terms Condiciones de pago (CondicionesDePago), hasta 1,000 caracteres sin «|»: «Crédito a 30 días», «50 % anticipo».
    # @option params [String] :pdf_language Idioma del PDF: es (por omisión) o en.
    # @option params [Hash] :addenda Addenda del receptor (Walmart, Soriana…), con sus propios campos.
    # @option params [Hash] :related CFDI relacionados (CfdiRelacionados): tipo de relación de c_TipoRelacion y los UUID.
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [Integer] :folio Folio (Folio) de esta factura en vez del siguiente de la serie: ese número toma su lugar en la numeración.
    # @option params [Boolean] :continue_sequence Con un folio elegido: true para que los siguientes sigan desde ese número.
    # @option params [String] :date Fecha de emisión (Fecha) si no es ahora, AAAA-MM-DDTHH:MM:SS hora de la Ciudad de México: hasta 72 horas ante…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email_cc Correos con copia, separados por comas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [Boolean] :draft Solo en POST /v1/invoices.
    # @option params [Boolean] :async Solo en POST /v1/invoices.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def apply(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/advances/#{Core.path(id)}/apply", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Retenciones: fiscalisto.retentions.
  class RetentionsResource
    def initialize(client)
      @client = client
    end

    # Timbrar una constancia de retenciones
    #
    # Timbra una constancia de retenciones e información de pagos (Retenciones 2.0) con los folios RET1, RET2… del emisor. Una vez por Idempotency-Key; con send_email y email la manda al receptor al timbrarla.
    #
    # POST /v1/retentions
    # https://fiscalisto.com/docs/api/referencia/retenciones/create-retention
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :code (obligatorio) Clave de la retención (CveRetenc), c_CveRetenc: 01 servicios profesionales, 05 arrendamiento, 14 dividendos,…
    # @option params [String] :description Descripción de la retención (DescRetenc); obligatoria con la clave 25 (otro tipo).
    # @option params [Hash] :recipient (obligatorio) Receptor de la constancia (Receptor): nacional con RFC y código postal, o extranjero.
    # @option params [Hash] :period (obligatorio) Periodo (Periodo): mes inicial, mes final y año.
    # @option params [Hash] :totals Totales (Totales).
    # @option params [Array] :taxes Impuestos del comprobante, por tipo.
    # @option params [Hash] :platform Complemento de servicios de plataformas tecnológicas (ServiciosPlataformasTecnologicas 1.0), obligatorio con…
    # @option params [Hash] :dividends Complemento de dividendos.
    # @option params [Hash] :interest Complemento de intereses.
    # @option params [Hash] :foreign_payment Complemento de pagos a extranjeros: obligatorio con code 18, y con 01, 02, 04 y 05 cuando el receptor es extr…
    # @option params [Hash] :distributable_remainder Complemento de dividendos con su nodo Remanente (remanente distribuible), obligatorio con code 15.
    # @option params [Hash] :trust_lease Complemento de arrendamiento en fideicomiso (Arrendamientoenfideicomiso 1.0), obligatorio con code 17.
    # @option params [Hash] :share_sale Complemento de enajenación de acciones u operaciones de valores (EnajenaciondeAcciones 1.0), obligatorio con…
    # @option params [Hash] :prize Complemento de premios (Premios 1.0), obligatorio con code 20.
    # @option params [Hash] :trust Complemento de fideicomisos que no realizan actividades empresariales (Fideicomisonoempresarial 1.0), obligat…
    # @option params [Hash] :retirement_plan Complemento de planes personales de retiro (Planesderetiro 1.1), obligatorio con code 22: lo del año anterior.
    # @option params [Hash] :mortgage_interest Complemento de intereses reales deducibles por créditos hipotecarios (Intereseshipotecarios 1.0), obligatorio…
    # @option params [Hash] :financial_derivatives Complemento de operaciones financieras derivadas de capital (Operacionesconderivados 1.0), obligatorio con co…
    # @option params [String] :replaces Folio fiscal (UUID) de la constancia que esta corrige: vigente, del mismo emisor y al mismo receptor (emitida…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :email Correo a donde se envía (varios separados por comas).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/retentions", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar constancias
    #
    # Las constancias del emisor, las más recientes primero.
    #
    # GET /v1/retentions
    # https://fiscalisto.com/docs/api/referencia/retenciones/list-retentions
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status valid, canceled, rejected o processing.
    # @option params [String] :recipient RFC del receptor.
    # @option params [String] :year Ejercicio, 4 dígitos.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/retentions", params, opts, kw)
    end

    # Ver una constancia
    #
    # Una constancia de retenciones con su estado, sus impuestos retenidos y, si se mandó, a quién.
    #
    # GET /v1/retentions/{id}
    # https://fiscalisto.com/docs/api/referencia/retenciones/get-retention
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @option params [Boolean] :refresh true para preguntar su estado al SAT ahora (cancelaciones en espera).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/retentions/#{Core.path(id)}", params, opts, kw, send: :query)
    end

    # Descargar el PDF
    #
    # La representación impresa de la constancia.
    #
    # GET /v1/retentions/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/retenciones/get-retention-pdf
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/retentions/#{Core.path(id)}/pdf", params, opts, kw, send: :query, result: :bytes)
    end

    # Descargar el XML
    #
    # El XML timbrado de la constancia, tal como lo tiene el SAT.
    #
    # GET /v1/retentions/{id}/xml
    # https://fiscalisto.com/docs/api/referencia/retenciones/get-retention-xml
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Con un UUID en vez del id, el emisor (iss_…) si la cuenta tiene varios.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def xml(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/retentions/#{Core.path(id)}/xml", params, opts, kw, send: :query, result: :text)
    end

    # Enviar por correo
    #
    # Manda el PDF y el XML de la constancia a los correos de to (o al que se dio al timbrarla). Dos envíos a la vez de la misma constancia: el segundo contesta email_failed.
    #
    # POST /v1/retentions/{id}/send
    # https://fiscalisto.com/docs/api/referencia/retenciones/send-retention
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :to A quién (correos separados por comas).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def send(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/retentions/#{Core.path(id)}/send", params, opts, kw, send: :body, idempotent: true)
    end

    # Cancelar una constancia
    #
    # Se cancela en el momento (no espera aceptación). No usa timbres.
    #
    # POST /v1/retentions/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/retenciones/cancel-retention
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :motive Motivo de cancelación (c_MotivoCancelacion): 01 con errores con relación (lleva substitution), 02 con errores…
    # @option params [String] :substitution El comprobante que sustituye a este (su id o su UUID), con el motivo 01.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/retentions/#{Core.path(id)}/cancel", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.employees.
  class EmployeesResource
    def initialize(client)
      @client = client
    end

    # Crear un empleado
    #
    # Un empleado del emisor para sus recibos de nómina: RFC, CURP, NSS, salario diario, salario diario integrado y periodicidad. Lo que no mande tiene el valor usual (contrato indefinido, jornada diurna, quincenal, riesgo clase I). warnings dice lo que el SAT podría rechazar.
    #
    # POST /v1/employees
    # https://fiscalisto.com/docs/api/referencia/nomina/create-employee
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :number (obligatorio) Número de empleado (NumEmpleado).
    # @option params [String] :name (obligatorio) Nombre completo del empleado, como en su constancia de situación fiscal.
    # @option params [String] :tax_id (obligatorio) RFC (Rfc), 12 caracteres una persona moral y 13 una física.
    # @option params [String] :curp (obligatorio) CURP, 18 caracteres.
    # @option params [String] :social_security_number (obligatorio) Número de seguridad social (NumSeguridadSocial), 11 dígitos.
    # @option params [String] :zip (obligatorio) Código postal del domicilio fiscal, 5 dígitos, como en la constancia de situación fiscal.
    # @option params [String] :email Correo del empleado, a donde van sus recibos con send_email.
    # @option params [String] :start_date (obligatorio) Fecha de inicio de la relación laboral (FechaInicioRelLaboral), AAAA-MM-DD.
    # @option params [String] :end_date Último día trabajado si ya no trabaja ahí, AAAA-MM-DD.
    # @option params [Numeric] :daily_salary (obligatorio) Salario diario.
    # @option params [Numeric] :integrated_daily_salary (obligatorio) Salario diario integrado (SalarioDiarioIntegrado): no menor al salario diario.
    # @option params [Numeric] :aguinaldo_days Días de aguinaldo al año: al menos 15 (LFT art.
    # @option params [Numeric] :vacation_premium Prima vacacional como fracción del salario de sus vacaciones: al menos 0.25 (LFT art.
    # @option params [Numeric] :pantry_vouchers Vales de despensa al mes (percepción 029), por los días pagados de cada recibo ordinario: exentos como previs…
    # @option params [Numeric] :savings_fund_rate Fondo de ahorro: fracción del sueldo de cada recibo que aporta la empresa y el trabajador por igual, hasta 0.…
    # @option params [String] :contract_type Tipo de contrato (TipoContrato), c_TipoContrato.
    # @option params [String] :workday_type Tipo de jornada (TipoJornada), c_TipoJornada.
    # @option params [String] :periodicity Periodicidad del pago (PeriodicidadPago): 02 semanal, 03 catorcenal, 04 quincenal (por omisión), 05 mensual.
    # @option params [String] :risk_class Clase de riesgo del puesto ante el IMSS (RiesgoPuesto), 1 a 5.
    # @option params [String] :state (obligatorio) Entidad federativa donde trabaja (ClaveEntFed): JAL, CMX, NLE…
    # @option params [Boolean] :border_zone true si trabaja en la zona libre de la frontera norte (salario mínimo de frontera).
    # @option params [Boolean] :unionized true si es sindicalizado (Sindicalizado).
    # @option params [String] :department Departamento (Departamento).
    # @option params [String] :position Puesto (Puesto).
    # @option params [String] :clabe CLABE de 18 dígitos de la cuenta del empleado: a donde le paga el archivo para el banco (POST /v1/payroll_ban…
    # @option params [String] :given_names Nombre(s), como en su CURP.
    # @option params [String] :first_surname Primer apellido, como en su CURP.
    # @option params [String] :second_surname Segundo apellido (vacío si tiene uno).
    # @option params [String] :imss_worker_type Tipo de trabajador del IMSS: 1 permanente, 2 eventual de la ciudad, 3 eventual de la construcción, 4 eventual…
    # @option params [String] :imss_salary_type Tipo de salario del IMSS: 0 fijo, 1 variable, 2 mixto.
    # @option params [String] :imss_reduced_week Semana o jornada reducida: 0 normal, 1 a 5 los días que trabaja a la semana, 6 jornada de menos de 8 horas.
    # @option params [String] :family_medicine_unit Unidad de medicina familiar (UMF) del IMSS, opcional.
    # @option params [String] :exit_reason Causa de la baja ante el IMSS, con end_date: 1 término de contrato, 2 separación voluntaria (la usual), 3 aba…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employees", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar empleados
    #
    # Los empleados del emisor, los más recientes primero.
    #
    # GET /v1/employees
    # https://fiscalisto.com/docs/api/referencia/nomina/list-employees
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/employees", params, opts, kw)
    end

    # Aumento de sueldo
    #
    # Un aumento para varios empleados a la vez, como «Aumento de sueldo» en Nómina › Empleados de la app: percent (porcentaje), amount (pesos más por día) o daily_salary (un salario nuevo). Cada empleado conserva su factor de integración (SDI ÷ salario), y el SDI nuevo queda como modificación de salario con fecha effective_date en Movimientos del IMSS, para presentarla a más tardar en imss_deadline (5 días hábiles, artículo 34 de la Ley del Seguro Social). Rige desde hoy o antes; los periodos ya timbrados desde entonces se pagan con el retroactivo de las incidencias. Si un empleado no puede recibirlo (no es un aumento, queda bajo el salario mínimo, no trabajaba ese día), contesta 400 y no cambia a nadie; dry_run true dice cómo quedaría cada uno, con su error, sin guardar.
    #
    # POST /v1/employee_raises
    # https://fiscalisto.com/docs/api/referencia/nomina/create-employee-raise
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Array] :employees Los empleados (emp_…).
    # @option params [Numeric] :percent Aumento en porcentaje: 5 es 5%.
    # @option params [Numeric] :amount Aumento en pesos por día.
    # @option params [Numeric] :daily_salary Un salario diario nuevo, igual para todos.
    # @option params [String] :effective_date Desde cuándo rige, hoy o antes (por omisión, hoy).
    # @option params [Boolean] :dry_run true: dice cómo quedaría cada empleado, sin guardar nada.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def give_raise(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employee_raises", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver un empleado
    #
    # Un empleado con sus datos y lo que el SAT podría rechazar en warnings.
    #
    # GET /v1/employees/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/employees/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un empleado
    #
    # Cambia solo los campos que manda; los recibos ya timbrados no cambian.
    #
    # POST /v1/employees/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-employee
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :number Número de empleado (NumEmpleado).
    # @option params [String] :name Nombre completo del empleado, como en su constancia de situación fiscal.
    # @option params [String] :tax_id RFC (Rfc), 12 caracteres una persona moral y 13 una física.
    # @option params [String] :curp CURP, 18 caracteres.
    # @option params [String] :social_security_number Número de seguridad social (NumSeguridadSocial), 11 dígitos.
    # @option params [String] :zip Código postal del domicilio fiscal, 5 dígitos, como en la constancia de situación fiscal.
    # @option params [String] :email Correo del empleado, a donde van sus recibos con send_email.
    # @option params [String] :start_date Fecha de inicio de la relación laboral (FechaInicioRelLaboral), AAAA-MM-DD.
    # @option params [String] :end_date Último día trabajado si ya no trabaja ahí, AAAA-MM-DD.
    # @option params [Numeric] :daily_salary Salario diario.
    # @option params [Numeric] :integrated_daily_salary Salario diario integrado (SalarioDiarioIntegrado): no menor al salario diario.
    # @option params [Numeric] :aguinaldo_days Días de aguinaldo al año: al menos 15 (LFT art.
    # @option params [Numeric] :vacation_premium Prima vacacional como fracción del salario de sus vacaciones: al menos 0.25 (LFT art.
    # @option params [Numeric] :pantry_vouchers Vales de despensa al mes (percepción 029), por los días pagados de cada recibo ordinario: exentos como previs…
    # @option params [Numeric] :savings_fund_rate Fondo de ahorro: fracción del sueldo de cada recibo que aporta la empresa y el trabajador por igual, hasta 0.…
    # @option params [String] :contract_type Tipo de contrato (TipoContrato), c_TipoContrato.
    # @option params [String] :workday_type Tipo de jornada (TipoJornada), c_TipoJornada.
    # @option params [String] :periodicity Periodicidad del pago (PeriodicidadPago): 02 semanal, 03 catorcenal, 04 quincenal (por omisión), 05 mensual.
    # @option params [String] :risk_class Clase de riesgo del puesto ante el IMSS (RiesgoPuesto), 1 a 5.
    # @option params [String] :state Entidad federativa donde trabaja (ClaveEntFed): JAL, CMX, NLE…
    # @option params [Boolean] :border_zone true si trabaja en la zona libre de la frontera norte (salario mínimo de frontera).
    # @option params [Boolean] :unionized true si es sindicalizado (Sindicalizado).
    # @option params [String] :department Departamento (Departamento).
    # @option params [String] :position Puesto (Puesto).
    # @option params [String] :clabe CLABE de 18 dígitos de la cuenta del empleado: a donde le paga el archivo para el banco (POST /v1/payroll_ban…
    # @option params [String] :given_names Nombre(s), como en su CURP.
    # @option params [String] :first_surname Primer apellido, como en su CURP.
    # @option params [String] :second_surname Segundo apellido (vacío si tiene uno).
    # @option params [String] :imss_worker_type Tipo de trabajador del IMSS: 1 permanente, 2 eventual de la ciudad, 3 eventual de la construcción, 4 eventual…
    # @option params [String] :imss_salary_type Tipo de salario del IMSS: 0 fijo, 1 variable, 2 mixto.
    # @option params [String] :imss_reduced_week Semana o jornada reducida: 0 normal, 1 a 5 los días que trabaja a la semana, 6 jornada de menos de 8 horas.
    # @option params [String] :family_medicine_unit Unidad de medicina familiar (UMF) del IMSS, opcional.
    # @option params [String] :exit_reason Causa de la baja ante el IMSS, con end_date: 1 término de contrato, 2 separación voluntaria (la usual), 3 aba…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employees/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un empleado
    #
    # Sus recibos timbrados se quedan.
    #
    # DELETE /v1/employees/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-employee
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/employees/#{Core.path(id)}", nil, opts, kw)
    end

    # Vacaciones de un empleado
    #
    # Los días de vacaciones de cada año de servicio (artículo 76 de la LFT: 12 el primero, dos más cada año hasta 20 y luego dos más cada cinco), los que tomó (los días de vacaciones de sus recibos timbrados, restados del año más antiguo que le quede), hasta cuándo dárselos (seis meses después del aniversario, artículo 81) y cuándo prescriben (un año después, artículo 516). pending_days son los de años cumplidos que no han prescrito: los que paga el finiquito.
    #
    # GET /v1/employees/{id}/vacations
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-vacations
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :as_of El día del saldo (AAAA-MM-DD); por omisión hoy, o su último día si ya salió.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def vacations(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/employees/#{Core.path(id)}/vacations", params, opts, kw, send: :query)
    end

    # Saldo de vacaciones antes de Fiscalisto
    #
    # Guarda lo que el empleado tenía en un día según sus registros: los días que le quedaban de años cumplidos y los que ya había tomado del año en curso. Los recibos timbrados antes de ese día no se cuentan. opening_date null lo quita.
    #
    # POST /v1/employees/{id}/vacations
    # https://fiscalisto.com/docs/api/referencia/nomina/update-employee-vacations
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :opening_date (obligatorio) El día del saldo, según sus registros de antes de Fiscalisto; null lo quita.
    # @option params [Numeric] :opening_pending_days Los días que ese día le quedaban de años de servicio cumplidos.
    # @option params [Numeric] :opening_taken_days Los días del año de servicio en curso que ya había tomado ese día.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_vacations(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employees/#{Core.path(id)}/vacations", params, opts, kw, send: :body, idempotent: true)
    end

    # Constancia de vacaciones
    #
    # El PDF de la constancia que el artículo 81 de la LFT pide entregar cada año: su antigüedad al último aniversario, los días de vacaciones que le corresponden (artículo 76) con su prima vacacional, cuándo disfrutarlos (las fechas que mande, o los seis meses siguientes al aniversario) y los días pendientes de años anteriores con cuándo prescriben, con espacio para las firmas. Antes de su primer aniversario dice cuándo lo cumple y cuántos días le tocarán.
    #
    # GET /v1/employees/{id}/vacations/certificate
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-vacation-certificate
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :enjoy_from El día en que empezará a disfrutarlas (AAAA-MM-DD), con enjoy_to.
    # @option params [String] :enjoy_to El día en que terminan (AAAA-MM-DD), con enjoy_from.
    # @option params [String] :as_of El día de la constancia (AAAA-MM-DD); por omisión hoy.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def vacation_certificate(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/employees/#{Core.path(id)}/vacations/certificate", params, opts, kw, send: :query, result: :bytes)
    end

    # Constancia de sueldos
    #
    # El PDF de lo que se le pagó al empleado en un año, de sus recibos de nómina vigentes por fecha de pago: cada percepción con su parte gravada y exenta, las deducciones (ISR retenido, IMSS y otras), los otros pagos con el subsidio para el empleo causado, y el neto. Resume sus CFDI de nómina, que son el comprobante de lo pagado y retenido (LISR art. 99 fr. III); no los sustituye. El empleado la baja también desde su portal.
    #
    # GET /v1/employees/{id}/pay_statement
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-pay-statement
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :year (obligatorio) El año (AAAA), desde 2014.
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pay_statement(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/employees/#{Core.path(id)}/pay_statement", params, opts, kw, send: :query, result: :bytes)
    end

    # Portal del empleado
    #
    # El enlace personal del empleado (sin cuenta) para ver, descargar y firmar de recibido sus recibos de nómina, ver sus vacaciones y pedir días; los celulares ligados, los que tienen avisos, sus últimos avisos y los recibos que firmó.
    #
    # GET /v1/employees/{id}/portal
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-portal
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def portal(id, opts = nil, **kw)
      @client.call("GET", "/v1/employees/#{Core.path(id)}/portal", nil, opts, kw)
    end

    # Activar, cambiar o apagar el portal
    #
    # enable crea el enlace (o deja el que tiene), renew hace uno nuevo (el anterior deja de funcionar y sus celulares se desligan) y disable lo apaga. Lo firmado se queda. Con send_email se lo manda a su correo.
    #
    # POST /v1/employees/{id}/portal
    # https://fiscalisto.com/docs/api/referencia/nomina/update-employee-portal
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :action (obligatorio) enable: crea el enlace (o deja el que tiene); renew: uno nuevo (el anterior deja de funcionar y sus celulares…
    # @option params [Boolean] :send_email Con enable o renew, le manda el enlace al correo del empleado.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_portal(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employees/#{Core.path(id)}/portal", params, opts, kw, send: :body, idempotent: true)
    end

    # Capacitación de un empleado
    #
    # Su ocupación del Catálogo Nacional de Ocupaciones (la suya o la de su puesto), su grado de estudios y los cursos que tomó con su constancia.
    #
    # GET /v1/employees/{id}/training
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-training
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def training(id, opts = nil, **kw)
      @client.call("GET", "/v1/employees/#{Core.path(id)}/training", nil, opts, kw)
    end

    # Ocupación y estudios de un empleado
    #
    # Su ocupación cuando no es la de su puesto (null usa la del puesto) y su grado de estudios terminados, que pide el aviso a la STPS.
    #
    # POST /v1/employees/{id}/training
    # https://fiscalisto.com/docs/api/referencia/nomina/update-employee-training
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :occupation Su clave del Catálogo Nacional de Ocupaciones cuando no es la de su puesto; null usa la de su puesto.
    # @option params [String] :education Su grado de estudios terminados, que pide el aviso a la STPS: primaria, secundaria, bachillerato, tecnico, li…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_training(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employees/#{Core.path(id)}/training", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.employee_notice_settings.
  class EmployeeNoticeSettingsResource
    def initialize(client)
      @client = client
    end

    # Avisos a empleados
    #
    # Qué avisos les llegan a los empleados del emisor en Mi nómina: recibo nuevo, recibo cancelado, la respuesta a sus vacaciones y el recordatorio de firmar. Llegan al celular de quien instaló Mi nómina y activó sus avisos; si no, a su correo (email_fallback).
    #
    # GET /v1/employee_notice_settings
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-notice-settings
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/employee_notice_settings", params, opts, kw, send: :query)
    end

    # Cambiar los avisos a empleados
    #
    # Lo que no mande se queda como estaba. Cada empleado puede, además, apagar los suyos desde su enlace.
    #
    # POST /v1/employee_notice_settings
    # https://fiscalisto.com/docs/api/referencia/nomina/update-employee-notice-settings
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…); por omisión, el único de la cuenta.
    # @option params [Boolean] :receipt «Ya está su recibo de nómina» en cuanto se timbra.
    # @option params [Boolean] :receipt_canceled Cuando un recibo suyo se cancela ante el SAT.
    # @option params [Boolean] :vacation Al aprobar o rechazar los días que pidió, con su nota.
    # @option params [Boolean] :survey Cuando se abre una encuesta NOM-035 o de clima para él (POST /v1/climate_surveys/{id}/open).
    # @option params [Boolean] :review Cuando se abre un ciclo de Desempeño con evaluaciones que le toca hacer (POST /v1/review_cycles/{id}/open).
    # @option params [Integer] :sign_reminder_days Si un recibo sigue sin firmar de recibido estos días después de timbrarse, se le recuerda una vez.
    # @option params [Boolean] :email_fallback A quien no activó los avisos en su celular le llega el mismo aviso a su correo.
    # @option params [Boolean] :quiet_hours Los avisos de entre las 21:00 y las 7:00 (hora del centro) llegan a las 7:00.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employee_notice_settings", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.vacation_requests.
  class VacationRequestsResource
    def initialize(client)
      @client = client
    end

    # Listar solicitudes de vacaciones
    #
    # Los días que los empleados pidieron desde su enlace, las más recientes primero.
    #
    # GET /v1/vacation_requests
    # https://fiscalisto.com/docs/api/referencia/nomina/list-vacation-requests
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :employee Solo las de este empleado (emp_…).
    # @option params [String] :status pending, approved, rejected o canceled.
    # @option params [Integer] :limit Cuántas, de 1 a 500.
    # @option params [String] :starting_after El id (vrq_…) de la última de la página anterior, para la siguiente.
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/vacation_requests", params, opts, kw)
    end

    # Ver una solicitud de vacaciones
    #
    # Una solicitud de vacaciones con su estado.
    #
    # GET /v1/vacation_requests/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-vacation-request
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/vacation_requests/#{Core.path(id)}", nil, opts, kw)
    end

    # Aprobar una solicitud de vacaciones
    #
    # La aprueba con los días calculados o los que mande en days. Los días aprobados se sugieren en las Incidencias del recibo del periodo; no se agregan solos.
    #
    # POST /v1/vacation_requests/{id}/approve
    # https://fiscalisto.com/docs/api/referencia/nomina/approve-vacation-request
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Numeric] :days Los días que descuenta de sus vacaciones, si no son los que se calcularon (sin domingos ni festivos), por eje…
    # @option params [String] :note Una nota que el empleado ve en su enlace.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def approve(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/vacation_requests/#{Core.path(id)}/approve", params, opts, kw, send: :body, idempotent: true)
    end

    # Rechazar una solicitud de vacaciones
    #
    # La rechaza; note (por qué) es obligatoria y el empleado la ve.
    #
    # POST /v1/vacation_requests/{id}/reject
    # https://fiscalisto.com/docs/api/referencia/nomina/reject-vacation-request
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :note (obligatorio) Por qué no se aprueba: el empleado lo ve en su enlace.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reject(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/vacation_requests/#{Core.path(id)}/reject", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.payroll_receipts.
  class PayrollReceiptsResource
    def initialize(client)
      @client = client
    end

    # Timbrar un recibo de nómina
    #
    # Nómina ordinaria (Nómina 1.2): Fiscalisto calcula sueldo, ISR con subsidio al empleo e IMSS del empleado y el periodo, con sus incidencias (incidents: horas extra, domingos, vacaciones y premios), como la app: el aguinaldo, la PTU y los finiquitos los calcula POST /v1/payroll_receipts/extraordinary; comisiones, Infonavit o préstamos los calcula su sistema y se timbran con POST /v1/payroll_receipts/external (pedirlos aquí contesta payroll_calculation_unsupported). Revise antes el recibo con POST /v1/payroll_receipts/preview y mande su confirmation_token: así solo se timbra el recibo que revisó (si cambió, 409 payroll_calculation_changed). Queda como factura tipo N (GET /v1/invoices/{id}). El emisor necesita employer_registration.
    #
    # POST /v1/payroll_receipts
    # https://fiscalisto.com/docs/api/referencia/nomina/create-payroll-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [Hash] :period (obligatorio) El periodo de pago: primer y último día (FechaInicialPago, FechaFinalPago) y, si no es el último, el día de p…
    # @option params [Numeric] :days Días pagados (NumDiasPagados).
    # @option params [Integer] :absences Faltas del periodo (días sin goce de sueldo), de 0 a 31: no se pagan (salen de days) y cotizan al IMSS solo e…
    # @option params [Integer] :disability_days Días de incapacidad que expidió el IMSS en el periodo, de 0 a 31: no se pagan (salen de days) y no causan cuo…
    # @option params [Hash] :incidents Incidencias del periodo, como en Nómina › Emitir recibos: horas extra, domingos, descansos y festivos trabaja…
    # @option params [String] :replaces El recibo vigente (inv_… o UUID) que este corrige, calculado por Fiscalisto para el mismo empleado: el nuevo…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :confirmation_token El confirmation_token de POST /v1/payroll_receipts/preview: timbra solo si el recibo calculado ahora es exact…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_receipts", params, opts, kw, send: :body, idempotent: true)
    end

    # Neto a bruto
    #
    # El salario diario y el SDI cuyo recibo ordinario de un periodo completo paga el neto que pide, con el ISR y el IMSS de hoy, como «Calcular desde el neto» en cada empleado de la app. Con employee toma su periodicidad y prestaciones; sin él, las que mande o las de la ley. Sin faltas, incidencias ni descuentos como Infonavit o préstamos. No guarda nada: para usarlo, actualice al empleado.
    #
    # POST /v1/payroll/net_to_gross
    # https://fiscalisto.com/docs/api/referencia/nomina/net-to-gross
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Numeric] :net (obligatorio) El neto que quiere pagar por un periodo completo, en pesos.
    # @option params [String] :employee Un empleado (emp_…): toma su periodicidad, zona y prestaciones (aguinaldo, prima vacacional, antigüedad, vale…
    # @option params [String] :periodicity 02 semanal, 03 catorcenal, 04 quincenal o 05 mensual.
    # @option params [Boolean] :border_zone En la zona libre de la frontera norte (su salario mínimo).
    # @option params [String] :start_date Fecha de ingreso: los días de vacaciones de su antigüedad.
    # @option params [Integer] :aguinaldo_days Días de aguinaldo al año (al menos 15).
    # @option params [Numeric] :vacation_premium Prima vacacional como fracción (al menos 0.25).
    # @option params [Numeric] :pantry_vouchers Vales de despensa al mes.
    # @option params [Numeric] :savings_fund_rate Fondo de ahorro como fracción del salario (hasta 0.13).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def net_to_gross(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll/net_to_gross", params, opts, kw, send: :body, idempotent: true)
    end

    # Calcular un recibo sin timbrar
    #
    # El recibo como se timbraría (percepciones con sus incidencias, ISR con el subsidio para el empleo, cuotas IMSS y el neto), sin timbrar ni usar timbres, con el confirmation_token que lo timbra tal cual y los avisos de lo que no incluye (un finiquito, valores del año que aún no se cargan).
    #
    # POST /v1/payroll_receipts/preview
    # https://fiscalisto.com/docs/api/referencia/nomina/preview-payroll-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [Hash] :period (obligatorio) El periodo de pago: primer y último día (FechaInicialPago, FechaFinalPago) y, si no es el último, el día de p…
    # @option params [Numeric] :days Días pagados (NumDiasPagados).
    # @option params [Integer] :absences Faltas del periodo (días sin goce de sueldo), de 0 a 31: no se pagan (salen de days) y cotizan al IMSS solo e…
    # @option params [Integer] :disability_days Días de incapacidad que expidió el IMSS en el periodo, de 0 a 31: no se pagan (salen de days) y no causan cuo…
    # @option params [Hash] :incidents Incidencias del periodo, como en Nómina › Emitir recibos: horas extra, domingos, descansos y festivos trabaja…
    # @option params [String] :replaces El recibo vigente (inv_… o UUID) que este corrige, calculado por Fiscalisto para el mismo empleado: el nuevo…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def preview(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_receipts/preview", params, opts, kw, send: :body, idempotent: true)
    end

    # Timbrar un aguinaldo, PTU o finiquito
    #
    # Nómina extraordinaria (TipoNomina E) que calcula Fiscalisto, como la app en Nómina › Aguinaldo, PTU y finiquitos: el aguinaldo (los días al año del empleado, al menos 15, en proporción a los trabajados, 30 UMA exentas), la PTU (la parte que le toca, 15 UMA exentas) o el finiquito al último día trabajado (end_date): aguinaldo, vacaciones y prima vacacional proporcionales, menos lo que ya se le pagó en el año, y con exit_reason dismissal la indemnización de 3 meses, opcionalmente 20 días por año, y la prima de antigüedad (90 UMA exentas por año de servicio). El ISR de un aguinaldo o PTU, con el cálculo que retenga menos (art. 96 LISR o 174 del Reglamento) salvo que pida uno. Uno por empleado, tipo y año (el finiquito, por fecha de baja): pedirlo otra vez devuelve el mismo; cancelado, se emite de nuevo. Revíselo antes con POST /v1/payroll_receipts/extraordinary/preview y mande su confirmation_token. Queda como factura tipo N.
    #
    # POST /v1/payroll_receipts/extraordinary
    # https://fiscalisto.com/docs/api/referencia/nomina/create-extraordinary-payroll-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [String] :kind (obligatorio) aguinaldo (sus días al año, al menos 15, en proporción a los trabajados), ptu (la parte que le toca de las ut…
    # @option params [String] :payment_date (obligatorio) FechaPago del recibo.
    # @option params [Integer] :year aguinaldo: el año que paga (por omisión, el de payment_date).
    # @option params [Numeric] :days_worked aguinaldo: los días trabajados en el año, si no son todos los que estuvo contratado (faltas o incapacidades q…
    # @option params [Numeric] :ptu_amount ptu: lo que le toca a este empleado (la mitad de la PTU por días trabajados y la mitad por salario, con el to…
    # @option params [String] :isr_method aguinaldo y ptu: cómo retener el ISR de la parte gravada.
    # @option params [String] :exit_reason finiquito: resignation (renuncia, común acuerdo o fin de contrato, por omisión; prima de antigüedad solo con…
    # @option params [Boolean] :twenty_days_per_year finiquito con dismissal: incluye 20 días por año de servicio (LFT art.
    # @option params [Numeric] :vacation_days_taken finiquito: los días de vacaciones del año de servicio en curso que ya tomó.
    # @option params [Numeric] :vacation_days_owed finiquito: los días de vacaciones de años de servicio cumplidos que no disfrutó ni han prescrito; se pagan co…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :confirmation_token El confirmation_token de POST /v1/payroll_receipts/extraordinary/preview: timbra solo si el recibo calculado…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_extraordinary(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_receipts/extraordinary", params, opts, kw, send: :body, idempotent: true)
    end

    # Calcular un aguinaldo, PTU o finiquito sin timbrar
    #
    # El recibo extraordinario como se timbraría (lo que paga, su parte exenta, el ISR con los dos cálculos y el neto), sin timbrar ni usar timbres, con el confirmation_token que lo timbra tal cual.
    #
    # POST /v1/payroll_receipts/extraordinary/preview
    # https://fiscalisto.com/docs/api/referencia/nomina/preview-extraordinary-payroll-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [String] :kind (obligatorio) aguinaldo (sus días al año, al menos 15, en proporción a los trabajados), ptu (la parte que le toca de las ut…
    # @option params [String] :payment_date (obligatorio) FechaPago del recibo.
    # @option params [Integer] :year aguinaldo: el año que paga (por omisión, el de payment_date).
    # @option params [Numeric] :days_worked aguinaldo: los días trabajados en el año, si no son todos los que estuvo contratado (faltas o incapacidades q…
    # @option params [Numeric] :ptu_amount ptu: lo que le toca a este empleado (la mitad de la PTU por días trabajados y la mitad por salario, con el to…
    # @option params [String] :isr_method aguinaldo y ptu: cómo retener el ISR de la parte gravada.
    # @option params [String] :exit_reason finiquito: resignation (renuncia, común acuerdo o fin de contrato, por omisión; prima de antigüedad solo con…
    # @option params [Boolean] :twenty_days_per_year finiquito con dismissal: incluye 20 días por año de servicio (LFT art.
    # @option params [Numeric] :vacation_days_taken finiquito: los días de vacaciones del año de servicio en curso que ya tomó.
    # @option params [Numeric] :vacation_days_owed finiquito: los días de vacaciones de años de servicio cumplidos que no disfrutó ni han prescrito; se pagan co…
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def preview_extraordinary(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_receipts/extraordinary/preview", params, opts, kw, send: :body, idempotent: true)
    end

    # Timbrar un recibo calculado por su sistema
    #
    # Para un sistema de nómina que ya calculó el recibo: timbra exactamente sus percepciones (gravado y exento), deducciones, otros pagos, horas extra, incapacidades, separación o jubilación, ordinario (type O) o extraordinario (type E: aguinaldo, PTU, finiquito). Fiscalisto no recalcula ni redondea nada: revisa el XSD, los catálogos del SAT, la Matriz de errores y que sus totales cuadren, y si algo falla responde payroll_invalid con todos los problemas en errors[] (cada uno con su param). Un recibo ordinario por empleado (RFC) y periodo; uno extraordinario por empleado y payroll_run_id. Repetirlo con los mismos importes devuelve el mismo recibo; con otros importes, 409 payroll_receipt_exists (corríjalo con replaces). Queda como factura tipo N.
    #
    # POST /v1/payroll_receipts/external
    # https://fiscalisto.com/docs/api/referencia/nomina/create-external-payroll-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (patrón) del recibo; sin él, el único emisor de su cuenta en este modo.
    # @option params [String] :type (obligatorio) TipoNomina: O ordinaria (periodicidad 01–10) o E extraordinaria (periodicidad 99).
    # @option params [String] :periodicity (obligatorio) PeriodicidadPago (c_PeriodicidadPago).
    # @option params [Hash] :period (obligatorio) FechaInicialPago, FechaFinalPago y FechaPago.
    # @option params [Numeric] :days (obligatorio) NumDiasPagados: de 0.001 a 36160, hasta 3 decimales.
    # @option params [Hash] :employer El patrón (Emisor del complemento): registro patronal y CURP si es persona física.
    # @option params [Hash] :employee (obligatorio) El empleado (Receptor y Nomina/Receptor) con los datos de su sistema de nómina; no usa ni cambia los empleado…
    # @option params [Array] :perceptions Percepciones (Percepcion): sueldo y demás, gravado y exento.
    # @option params [Hash] :separation SeparacionIndemnizacion: con las percepciones 022, 023 o 025.
    # @option params [Hash] :retirement JubilacionPensionRetiro: con las percepciones 039 o 044.
    # @option params [Array] :deductions Deducciones (Deduccion): ISR, cuotas IMSS y demás.
    # @option params [Array] :other_payments Otros pagos (OtroPago): subsidio para el empleo.
    # @option params [Array] :disabilities Incapacidades: con la percepción 014 o la deducción 006.
    # @option params [Hash] :totals (obligatorio) Los totales que calculó su sistema: Fiscalisto los compara al centavo con las líneas y rechaza el recibo si n…
    # @option params [Hash] :references Sus ids: el empleado y la corrida de nómina.
    # @option params [String] :replaces El recibo vigente (inv_… o UUID) que este sustituye: relación 04 y se cancela con motivo 01.
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_external(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_receipts/external", params, opts, kw, send: :body, idempotent: true)
    end

    # Revisar un recibo calculado por su sistema, sin timbrar
    #
    # Las mismas revisiones que al timbrar, sin timbrar ni usar timbres: devuelve el recibo como se timbraría, los avisos y el XML sin sellar (unsigned_xml), con sus importes tal cual. Si algo falla, payroll_invalid con errors[].
    #
    # POST /v1/payroll_receipts/external/preview
    # https://fiscalisto.com/docs/api/referencia/nomina/preview-external-payroll-receipt
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (patrón) del recibo; sin él, el único emisor de su cuenta en este modo.
    # @option params [String] :type (obligatorio) TipoNomina: O ordinaria (periodicidad 01–10) o E extraordinaria (periodicidad 99).
    # @option params [String] :periodicity (obligatorio) PeriodicidadPago (c_PeriodicidadPago).
    # @option params [Hash] :period (obligatorio) FechaInicialPago, FechaFinalPago y FechaPago.
    # @option params [Numeric] :days (obligatorio) NumDiasPagados: de 0.001 a 36160, hasta 3 decimales.
    # @option params [Hash] :employer El patrón (Emisor del complemento): registro patronal y CURP si es persona física.
    # @option params [Hash] :employee (obligatorio) El empleado (Receptor y Nomina/Receptor) con los datos de su sistema de nómina; no usa ni cambia los empleado…
    # @option params [Array] :perceptions Percepciones (Percepcion): sueldo y demás, gravado y exento.
    # @option params [Hash] :separation SeparacionIndemnizacion: con las percepciones 022, 023 o 025.
    # @option params [Hash] :retirement JubilacionPensionRetiro: con las percepciones 039 o 044.
    # @option params [Array] :deductions Deducciones (Deduccion): ISR, cuotas IMSS y demás.
    # @option params [Array] :other_payments Otros pagos (OtroPago): subsidio para el empleo.
    # @option params [Array] :disabilities Incapacidades: con la percepción 014 o la deducción 006.
    # @option params [Hash] :totals (obligatorio) Los totales que calculó su sistema: Fiscalisto los compara al centavo con las líneas y rechaza el recibo si n…
    # @option params [Hash] :references Sus ids: el empleado y la corrida de nómina.
    # @option params [String] :replaces El recibo vigente (inv_… o UUID) que este sustituye: relación 04 y se cancela con motivo 01.
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def preview_external(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_receipts/external/preview", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.payroll_batches.
  class PayrollBatchesResource
    def initialize(client)
      @client = client
    end

    # Timbrar una nómina completa (lote)
    #
    # Toda una corrida de nómina en una solicitud: hasta 1,000 recibos de un emisor, timbrados en segundo plano uno tras otro, sin el límite de timbres por segundo de una sola solicitud. De una de dos formas, nunca mezcladas: receipts (ids de empleado; Fiscalisto calcula cada recibo con el periodo del lote) o external_receipts (los recibos que calculó su sistema, como en POST /v1/payroll_receipts/external, con reference en lugar de metadata). Todo lo que se puede revisar antes se revisa antes: si algo falla, no se timbra ninguno y el error dice qué recibo (param receipts.3.employee). Lo que solo se sabe al timbrar (un periodo ya pagado, el SAT que rechaza un RFC) queda en ese recibo, con su error. Un recibo por empleado y periodo: mandar la corrida otra vez, aun con otra Idempotency-Key, devuelve los recibos que ya tiene. Responde 202; escuche payroll_batch.completed o consulte el lote.
    #
    # POST /v1/payroll_batches
    # https://fiscalisto.com/docs/api/referencia/nomina/create-payroll-batch
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :name Nombre del lote, para usted (Quincena 20).
    # @option params [Hash] :period El periodo de pago: primer y último día (FechaInicialPago, FechaFinalPago) y, si no es el último, el día de p…
    # @option params [Boolean] :send_email Mandar a cada empleado su recibo por correo (a los que tienen correo).
    # @option params [Array] :receipts Los recibos que Fiscalisto calcula: un empleado (emp_…) en cada uno, como en POST /v1/payroll_receipts.
    # @option params [Array] :external_receipts Los recibos que calculó su sistema de nómina, timbrados tal cual.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_batches", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar lotes de nómina
    #
    # Los lotes de nómina, los más recientes primero, con cuántos recibos se timbraron y cuántos no.
    #
    # GET /v1/payroll_batches
    # https://fiscalisto.com/docs/api/referencia/nomina/list-payroll-batches
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/payroll_batches", params, opts, kw)
    end

    # Ver un lote de nómina
    #
    # Con el recibo de cada empleado: timbrado (su factura y UUID) o por qué no (error.code y error.message).
    #
    # GET /v1/payroll_batches/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-batch
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_batches/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.payroll_approvals.
  class PayrollApprovalsResource
    def initialize(client)
      @client = client
    end

    # Pedir aprobación de la prenómina
    #
    # Para un emisor que pide aprobar la prenómina antes de timbrar (Ajustes › Aprobaciones › Prenómina en la app): manda la nómina del periodo a aprobación. Calcula cada recibo como lo timbraría POST /v1/payroll_receipts y guarda sus importes; reemplaza la que se haya pedido antes para el mismo periodo, y avisa a quienes pueden aprobarla. La aprueba o rechaza una persona en Nómina › Emitir recibos (no una llave). Mientras no esté aprobada, POST /v1/payroll_receipts y POST /v1/payroll_batches de ese periodo contestan payroll_approval_required; aprobada, timbran solo los recibos de ella con los mismos importes y fecha de pago.
    #
    # POST /v1/payroll_approvals
    # https://fiscalisto.com/docs/api/referencia/nomina/create-payroll-approval
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Hash] :period (obligatorio) El periodo de pago de la nómina: FechaInicialPago, FechaFinalPago y FechaPago de sus recibos.
    # @option params [Array] :receipts (obligatorio) El recibo de cada empleado de la nómina, como se timbraría con POST /v1/payroll_receipts.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_approvals", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar prenóminas por aprobar
    #
    # Las prenóminas pedidas para aprobación, las más recientes primero.
    #
    # GET /v1/payroll_approvals
    # https://fiscalisto.com/docs/api/referencia/nomina/list-payroll-approvals
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :status pending, approved, rejected, withdrawn o replaced.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/payroll_approvals", params, opts, kw)
    end

    # Ver una prenómina por aprobar
    #
    # Con su estado y los importes de cada recibo.
    #
    # GET /v1/payroll_approvals/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-approval
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_approvals/#{Core.path(id)}", nil, opts, kw)
    end

    # Retirar una prenómina por aprobar
    #
    # Retira una que espera aprobación (status withdrawn), para corregirla y pedirla de nuevo, o porque no se pagará.
    #
    # POST /v1/payroll_approvals/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/nomina/cancel-payroll-approval
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_approvals/#{Core.path(id)}/cancel", nil, opts, kw, idempotent: true)
    end
  end

  # Nómina: fiscalisto.payroll_bank_files.
  class PayrollBankFilesResource
    def initialize(client)
      @client = client
    end

    # Archivo para pagar la nómina en el banco
    #
    # El archivo de dispersión que paga el neto de cada empleado desde el portal de su banco: BBVA (Net Cash), Banamex (BancaNet, layout D), Banorte (Banorte en su Empresa), Santander (Enlace) o un CSV de SPEI para cualquier banco. Toma los recibos de nómina timbrados (y no cancelados) con esa fecha de pago, los suma por empleado y le paga a la CLABE de su ficha (clabe en el empleado): a la misma institución por cuenta, a otra por SPEI. No cobra ni mueve dinero: usted lo sube al banco y lo autoriza ahí. Quien no se puede pagar (sin CLABE, otro banco en Santander) va en excluded con su razón. Suba el primero como prueba: cada portal lo valida antes de cargar nada.
    #
    # POST /v1/payroll_bank_files
    # https://fiscalisto.com/docs/api/referencia/nomina/create-payroll-bank-file
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :payment_date (obligatorio) La fecha de pago de los recibos (FechaPago): se pagan los recibos de nómina timbrados con esa fecha, sumados…
    # @option params [String] :layout El formato del banco: bbva (Net Cash), banamex (BancaNet, layout D), banorte (Banorte en su Empresa), santand…
    # @option params [String] :account La CLABE de la cuenta de cargo del emisor.
    # @option params [Integer] :sequence El archivo del día (1 a 99): un segundo archivo el mismo día lleva otro número.
    # @option params [String] :client_number Banamex: su número de cliente de BancaNet (12 dígitos).
    # @option params [String] :issuer_number Banorte: su número de emisora (5 dígitos).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_bank_files", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.payroll_payouts.
  class PayrollPayoutsResource
    def initialize(client)
      @client = client
    end

    # Pagar la nómina por transferencia
    #
    # Como «Pagar por transferencia» en la app: el neto de cada recibo de nómina timbrado (y no cancelado) con esa fecha de pago, menos los vales de despensa, a la CLABE de cada empleado, en un pago a proveedores en borrador (Pagos). Nunca sale solo: alguien del equipo lo abre en app_url y lo firma con su llave de acceso. Solo se le paga a una CLABE ya registrada en Pagos, aprobada y pasada su espera: la API no registra CLABEs, así que cambiar la clabe de un empleado no desvía su nómina (se registra en la app y espera como cualquier cuenta). Quien no se puede pagar va en excluded con su razón; quien ya va en otro pago de esta nómina no se paga dos veces. Solo si la empresa paga con Fintoc y deja que la API prepare pagos en Pagos › Configurar pagos (si no, 403 payouts_api_disabled); si nadie se puede pagar contesta 400 parameter_invalid con el motivo. Pide Idempotency-Key: si la respuesta se pierde, repítala con el mismo valor y contesta el mismo pago; la misma llave con otra fecha contesta 409 idempotency_key_reused.
    #
    # POST /v1/payroll_payouts
    # https://fiscalisto.com/docs/api/referencia/nomina/create-payroll-payout
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :payment_date (obligatorio) La fecha de pago (FechaPago) de los recibos de nómina timbrados que paga (AAAA-MM-DD).
    # @option params [String] :pay_on El día en que sale (AAAA-MM-DD, hoy o después).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_payouts", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.imss_movements.
  class ImssMovementsResource
    def initialize(client)
      @client = client
    end

    # Agregar un movimiento del IMSS
    #
    # Un movimiento afiliatorio a mano. Casi nunca hace falta: al crear un empleado se registra su alta, al cambiar su integrated_daily_salary la modificación (con fecha de hoy), al ponerle end_date su baja y al volver a contratarlo su reingreso. Queda pendiente de presentar.
    #
    # POST /v1/imss_movements
    # https://fiscalisto.com/docs/api/referencia/nomina/create-imss-movement
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [String] :kind (obligatorio) alta (o reingreso): tipo 08; modificacion: cambio de salario, tipo 07; baja: tipo 02.
    # @option params [String] :date (obligatorio) El día en que surte efecto (AAAA-MM-DD, hora de México).
    # @option params [Numeric] :integrated_daily_salary El salario diario integrado que se declara (en altas, reingresos y modificaciones).
    # @option params [String] :exit_reason Solo en bajas: 1 término de contrato, 2 separación voluntaria, 3 abandono, 4 defunción, 5 clausura, 6 otras,…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/imss_movements", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar movimientos del IMSS
    #
    # Los movimientos del emisor por presentar (status=pending, por omisión: todos, del más antiguo al más reciente, como van en los archivos) o ya presentados (status=reported: los 500 más recientes).
    #
    # GET /v1/imss_movements
    # https://fiscalisto.com/docs/api/referencia/nomina/list-imss-movements
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status pending (por omisión) o reported.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/imss_movements", params, opts, kw)
    end

    # Marcar movimientos como presentados
    #
    # Cuando el IMSS ya los recibió (el acuse de IDSE o la importación en SUA): pasan a reported y ya no cambian ni se borran. Con reported false vuelven a pendientes. Los que el IMSS rechazó van en rejected con su razón: quedan pending con imss_rejection hasta que los corrija. Devuelve los movimientos como quedaron.
    #
    # POST /v1/imss_movements/report
    # https://fiscalisto.com/docs/api/referencia/nomina/report-imss-movements
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [Array] :movements Los movimientos (imv_…) que el IMSS ya recibió, hasta 1,000.
    # @option params [Boolean] :reported true (por omisión): marcarlos como presentados; false: devolverlos a pendientes (si los marcó por error).
    # @option params [Array] :rejected Los que el IMSS rechazó en el acuse del IDSE, cada uno con su razón: vuelven a pendientes con imss_rejection,…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def report(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/imss_movements/report", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver un movimiento del IMSS
    #
    # El movimiento con lo que el IMSS rechazaría en problems.
    #
    # GET /v1/imss_movements/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-imss-movement
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/imss_movements/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un movimiento del IMSS
    #
    # Solo uno pendiente: uno ya presentado se queda como lo tiene el IMSS.
    #
    # POST /v1/imss_movements/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-imss-movement
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :kind alta (o reingreso): tipo 08; modificacion: cambio de salario, tipo 07; baja: tipo 02.
    # @option params [String] :date El día en que surte efecto (AAAA-MM-DD, hora de México).
    # @option params [Numeric] :integrated_daily_salary El salario diario integrado que se declara (en altas, reingresos y modificaciones).
    # @option params [String] :exit_reason Solo en bajas: 1 término de contrato, 2 separación voluntaria, 3 abandono, 4 defunción, 5 clausura, 6 otras,…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/imss_movements/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un movimiento del IMSS
    #
    # Solo uno pendiente (por ejemplo, un alta registrada por error).
    #
    # DELETE /v1/imss_movements/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-imss-movement
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/imss_movements/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.imss_files.
  class ImssFilesResource
    def initialize(client)
      @client = client
    end

    # Archivos para IDSE o SUA
    #
    # Los archivos de los movimientos pendientes: para IDSE (formato de 168 posiciones, un archivo por tipo: reingresos, modificaciones de salario y bajas; necesita la guía de su subdelegación) o para importar en SUA (ASEG.TXT con las altas y MOVT.TXT con los demás). El salario se declara topado a 25 UMA y nunca abajo del mínimo. El emisor necesita employer_registration. Los que el IMSS rechazaría van en refused con su razón. No los marca como presentados: hágalo con POST /v1/imss_movements/report cuando el IMSS los reciba.
    #
    # POST /v1/imss_files
    # https://fiscalisto.com/docs/api/referencia/nomina/create-imss-files
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :format (obligatorio) idse: los archivos de IDSE (uno por tipo: reingresos, modificaciones, bajas); sua: ASEG.TXT (altas) y MOVT.TX…
    # @option params [Array] :movements Los movimientos (imv_…) pendientes que van en los archivos.
    # @option params [String] :guide IDSE: la guía de 5 dígitos de su subdelegación.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/imss_files", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.employee_deductions.
  class EmployeeDeductionsResource
    def initialize(client)
      @client = client
    end

    # Agregar un descuento a un empleado
    #
    # Infonavit, Fonacot, pensión alimenticia, préstamo o anticipo del patrón, caja de ahorro o cuota sindical. Cada recibo ordinario desde start_date lo toma solo (POST /v1/payroll_receipts), con los límites de la Ley Federal del Trabajo: Infonavit por cada día del periodo aunque haya faltas, más $15 de seguro de daños por bimestre; Fonacot hasta el 20% del sueldo; préstamos, anticipos y caja hasta el 30% de lo que el sueldo excede del salario mínimo; del salario mínimo solo la pensión, Infonavit (20%) y Fonacot (10%). La pensión va primero, y lo que no alcanza del neto no se descuenta.
    #
    # POST /v1/employee_deductions
    # https://fiscalisto.com/docs/api/referencia/nomina/create-employee-deduction
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [String] :kind (obligatorio) infonavit (deducción 010), fonacot (011), pension (pensión alimenticia, 007), prestamo (préstamo del patrón,…
    # @option params [String] :mode (obligatorio) Cómo se calcula.
    # @option params [Numeric] :value (obligatorio) El porcentaje (de más de 0 a 100), el factor de VSM o el monto en pesos, según mode.
    # @option params [Numeric] :total Solo prestamo y anticipo: el monto prestado.
    # @option params [String] :reference El número de crédito de Infonavit o Fonacot, el expediente o una nota.
    # @option params [String] :beneficiary Solo pension, y obligatorio: a quién se paga.
    # @option params [String] :start_date (obligatorio) Desde qué día se descuenta (AAAA-MM-DD).
    # @option params [String] :end_date Hasta qué día (incluido).
    # @option params [Boolean] :extraordinary Solo pension: también se descuenta del aguinaldo, la PTU y el finiquito (por omisión, true).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employee_deductions", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar descuentos
    #
    # Los descuentos vigentes del emisor, o de un empleado con employee.
    #
    # GET /v1/employee_deductions
    # https://fiscalisto.com/docs/api/referencia/nomina/list-employee-deductions
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :employee Solo los de este empleado (emp_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/employee_deductions", params, opts, kw, send: :query)
    end

    # Ver un descuento
    #
    # El descuento con lo que ya tomaron los recibos (paid) y lo que falta de un préstamo (balance).
    #
    # GET /v1/employee_deductions/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-employee-deduction
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/employee_deductions/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un descuento
    #
    # Desde el siguiente recibo; los timbrados se quedan como están.
    #
    # POST /v1/employee_deductions/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-employee-deduction
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :kind infonavit (deducción 010), fonacot (011), pension (pensión alimenticia, 007), prestamo (préstamo del patrón,…
    # @option params [String] :mode Cómo se calcula.
    # @option params [Numeric] :value El porcentaje (de más de 0 a 100), el factor de VSM o el monto en pesos, según mode.
    # @option params [Numeric] :total Solo prestamo y anticipo: el monto prestado.
    # @option params [String] :reference El número de crédito de Infonavit o Fonacot, el expediente o una nota.
    # @option params [String] :beneficiary Solo pension, y obligatorio: a quién se paga.
    # @option params [String] :start_date Desde qué día se descuenta (AAAA-MM-DD).
    # @option params [String] :end_date Hasta qué día (incluido).
    # @option params [Boolean] :extraordinary Solo pension: también se descuenta del aguinaldo, la PTU y el finiquito (por omisión, true).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/employee_deductions/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar un descuento
    #
    # Los recibos siguientes ya no lo toman; los timbrados lo conservan.
    #
    # DELETE /v1/employee_deductions/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-employee-deduction
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/employee_deductions/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.variable_salaries.
  class VariableSalariesResource
    def initialize(client)
      @client = client
    end

    # Salario variable de un bimestre
    #
    # Lo que las horas extra triples, la prima dominical, otros ingresos y lo que los premios de puntualidad y asistencia pasan del 10% del SBC suman al SDI de cada empleado, de los recibos timbrados del bimestre, entre sus días trabajados (artículos 27 y 30 de la LSS). Las horas dobles no cuentan. No cambia nada: aplíquelo con POST /v1/variable_salaries.
    #
    # GET /v1/variable_salaries
    # https://fiscalisto.com/docs/api/referencia/nomina/get-variable-salary
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :bimester (obligatorio) AAAA-B: 2026-5 es septiembre–octubre de 2026.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/variable_salaries", params, opts, kw, send: :query)
    end

    # Aplicar el salario variable de un bimestre
    #
    # A los empleados que diga: su parte variable del SDI desde el primer día del bimestre siguiente (los recibos de periodos anteriores siguen con la que tenían) y la modificación de salario pendiente de presentar en IDSE (GET /v1/imss_movements), a más tardar el quinto día hábil del mes (artículo 34 de la LSS). Repetirlo no hace nada.
    #
    # POST /v1/variable_salaries
    # https://fiscalisto.com/docs/api/referencia/nomina/apply-variable-salary
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…); por omisión, el único de la cuenta.
    # @option params [String] :bimester (obligatorio) El bimestre: AAAA-B, de 1 (enero–febrero) a 6 (noviembre–diciembre).
    # @option params [Array] :employees (obligatorio) Los empleados (emp_…) a los que se aplica.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def apply(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/variable_salaries", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.annual_adjustments.
  class AnnualAdjustmentsResource
    def initialize(client)
      @client = client
    end

    # Ajuste anual del ISR
    #
    # El ISR del ejercicio de cada empleado (tarifa del artículo 152 sobre lo gravado de sus recibos timbrados del año, menos el subsidio para el empleo del año) contra lo que le retuvieron (artículo 97 de la Ley del ISR). balance positivo es a cargo del empleado; negativo, a su favor. excluded dice por qué no se le calcula. No cambia nada: aplíquelo con POST /v1/annual_adjustments.
    #
    # GET /v1/annual_adjustments
    # https://fiscalisto.com/docs/api/referencia/nomina/get-annual-adjustment
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year (obligatorio) El ejercicio: 2026.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/annual_adjustments", params, opts, kw, send: :query)
    end

    # Aplicar el ajuste anual
    #
    # action apply: la diferencia de cada empleado va en sus siguientes recibos ordinarios pagados desde el 1 de enero del año siguiente: a cargo como Deducción 101 (hasta su neto; el resto, en el siguiente), a favor como OtroPago 004 con CompensacionSaldosAFavor. Repetirlo no hace nada. undo la quita mientras ningún recibo timbrado la lleve. files_own_return y no_own_return marcan si el empleado presentará su propia declaración anual.
    #
    # POST /v1/annual_adjustments
    # https://fiscalisto.com/docs/api/referencia/nomina/update-annual-adjustment
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…); por omisión, el único de la cuenta.
    # @option params [Integer] :year (obligatorio) El ejercicio: 2026.
    # @option params [String] :action (obligatorio) apply: aplica la diferencia en sus siguientes recibos (desde enero del año siguiente).
    # @option params [Array] :employees (obligatorio) Los empleados (emp_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/annual_adjustments", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.payroll_taxes.
  class PayrollTaxesResource
    def initialize(client)
      @client = client
    end

    # Impuesto sobre nómina del mes
    #
    # El impuesto sobre nómina de cada estado: la suma de los recibos timbrados con fecha de pago en el mes, por el estado donde trabaja cada empleado (ClaveEntFed), menos las percepciones de excluded_perception_types, por la tasa del estado y sus sobretasas. Se declara y paga en el portal de finanzas de cada estado.
    #
    # GET /v1/payroll_taxes
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-tax
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :month (obligatorio) El mes: 2026-11.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_taxes", params, opts, kw, send: :query)
    end

    # Qué no grava el impuesto sobre nómina
    #
    # Las percepciones que no suman a la base (por omisión, las que casi todos los estados dejan fuera: PTU, reembolsos, indemnizaciones, primas de antigüedad, jubilaciones, cuotas de seguridad social pagadas por el patrón y viáticos) y la opción de tasa de cada estado que la tiene, guardadas para el emisor. Lo que no mande se queda como estaba.
    #
    # POST /v1/payroll_taxes/settings
    # https://fiscalisto.com/docs/api/referencia/nomina/update-payroll-tax-settings
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…); por omisión, el único de la cuenta.
    # @option params [Array] :excluded_perception_types Las percepciones (c_TipoPercepcion) que no suman a la base, como las deja fuera la ley de su estado.
    # @option params [Hash] :state_options La opción de tasa de cada estado que la tiene, por su c_Estado: {"BCN": "hasta50"}.
    # @option params [Hash] :due_days El día del mes siguiente en que se paga el impuesto de cada estado, por su c_Estado: {"NLE": 17}.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_settings(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_taxes/settings", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.payroll_reports.
  class PayrollReportsResource
    def initialize(client)
      @client = client
    end

    # Acumulados de nómina
    #
    # Los acumulados del año de los recibos de nómina timbrados vigentes (ordinarios y extraordinarios, por fecha de pago), como «Nómina › Reportes» de la app: cada percepción, deducción y otro pago por su clave del SAT y la del patrón, mes por mes, y los totales de cada empleado (percepciones gravadas y exentas, ISR e IMSS retenidos, subsidio para el empleo causado y neto). Con employee, solo los de ese empleado.
    #
    # GET /v1/payroll_reports/accumulated
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-accumulated
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year El año: 2026 (por omisión, el actual).
    # @option params [String] :employee Un empleado (emp_…): solo sus recibos.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def accumulated(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_reports/accumulated", params, opts, kw, send: :query)
    end

    # Costo de la nómina
    #
    # Lo que cuesta la nómina del año mes por mes: lo pagado a los empleados (percepciones y otros pagos de los recibos timbrados, sin el subsidio para el empleo) más las cuotas del patrón al IMSS, SAR e Infonavit y el impuesto sobre nómina, calculados como GET /v1/accounting/payroll_provisions/{month}. En un año cuyas tasas aún no están cargadas (rates_loaded false), esas columnas y total vienen en null.
    #
    # GET /v1/payroll_reports/cost
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-cost
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year El año: 2026 (por omisión, el actual).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cost(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_reports/cost", params, opts, kw, send: :query)
    end
  end

  # Nómina: fiscalisto.payroll_calendar.
  class PayrollCalendarResource
    def initialize(client)
      @client = client
    end

    # Calendario de nómina
    #
    # Como «Nómina › Calendario» de la app: cada nómina en su fecha de pago (con cuántos de sus recibos están timbrados y el último día para timbrarlos), y lo que se paga por ella, con el artículo de la ley de cada fecha: cuotas del IMSS (día 17 del mes siguiente, LSS art. 39), RCV e Infonavit (bimestrales, día 17), impuesto sobre nómina de cada estado donde trabajan sus empleados, aguinaldo (antes del 20 de diciembre), PTU, prima de riesgo de trabajo (febrero) y ajuste anual. Una fecha de pago al IMSS que cae en día inhábil o viernes pasa al siguiente día hábil (CFF art. 12, RACERF art. 3).
    #
    # GET /v1/payroll_calendar
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-calendar
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :days_ahead Hasta cuántos días adelante (por omisión 90, hasta 366).
    # @option params [Integer] :days_back Desde cuántos días atrás (por omisión 31, hasta 366).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_calendar", params, opts, kw, send: :query)
    end

    # Marcar un pago de nómina como pagado
    #
    # Marca (paid true) o desmarca (false) un pago del calendario de nómina: imss, rcv_infonavit, isn, aguinaldo, ptu, prima_riesgo, ajuste_anual, icsoe, sisub o renovacion_repse, con su key como lo da GET /v1/payroll_calendar. Una nómina (pago) queda hecha al timbrar sus recibos.
    #
    # POST /v1/payroll_calendar/mark
    # https://fiscalisto.com/docs/api/referencia/nomina/mark-payroll-calendar-event
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :obligation (obligatorio) imss, rcv_infonavit, isn, aguinaldo, ptu, prima_riesgo, ajuste_anual, icsoe, sisub o renovacion_repse.
    # @option params [String] :key (obligatorio) Como lo da GET /v1/payroll_calendar: 2026-11, 2026-B6, 2026-C3, 2026, 2026-11:CMX.
    # @option params [Boolean] :paid (obligatorio) true lo marca pagado; false lo desmarca.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_calendar/mark", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.repse_contracts.
  class RepseContractsResource
    def initialize(client)
      @client = client
    end

    # Registrar un contrato de servicios especializados
    #
    # Un contrato de servicios u obras especializadas (LFT art. 15 y 15-A) con su cliente, el centro de trabajo y quién trabaja en él y desde cuándo, como «Nómina › REPSE › + Contrato» en la app. Con él se arman los informes cuatrimestrales ICSOE del IMSS (LSS art. 15-A) y SISUB del Infonavit (Ley del Infonavit art. 29 Bis) de GET /v1/repse_returns/{period}, y aparecen sus fechas en el calendario de nómina. Un número de contrato que ya usó contesta parameter_invalid en number; un trabajador de otro emisor, en workers.
    #
    # POST /v1/repse_contracts
    # https://fiscalisto.com/docs/api/referencia/nomina/create-repse-contract
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :number (obligatorio) Número de contrato: dígitos, hasta 20 (así lo pide el SISUB).
    # @option params [String] :kind (obligatorio) Tipo de contrato, como lo dice el contrato.
    # @option params [String] :contract_object (obligatorio) Objeto del contrato.
    # @option params [String] :service (obligatorio) El servicio u obra especializada registrado en el REPSE que cubre.
    # @option params [Numeric] :amount (obligatorio) Monto pactado, en pesos.
    # @option params [String] :start_date (obligatorio) Inicio de su vigencia (YYYY-MM-DD).
    # @option params [String] :end_date Fecha de término; null si es por tiempo indefinido.
    # @option params [Integer] :estimated_workers (obligatorio) Número estimado mensual de trabajadores que pone a disposición.
    # @option params [String] :client_tax_id (obligatorio) RFC del cliente (el beneficiario de los servicios).
    # @option params [String] :client_name (obligatorio) Razón social del cliente.
    # @option params [String] :client_employer_registration Registro patronal del cliente ante el IMSS, si tiene.
    # @option params [Hash] :client_address (obligatorio) Domicilio fiscal del cliente.
    # @option params [Hash] :site_address (obligatorio) El centro de trabajo donde trabajan las personas que pone a disposición.
    # @option params [Array] :workers (obligatorio) Quién trabaja en el contrato y desde cuándo (hasta 2,000).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/repse_contracts", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar contratos de servicios especializados
    #
    # Los contratos del emisor que no ha archivado, por fecha de inicio (el más antiguo primero) y número.
    #
    # GET /v1/repse_contracts
    # https://fiscalisto.com/docs/api/referencia/nomina/list-repse-contracts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/repse_contracts", params, opts, kw)
    end

    # Ver un contrato de servicios especializados
    #
    # Un contrato con su cliente, centro de trabajo y trabajadores.
    #
    # GET /v1/repse_contracts/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-repse-contract
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/repse_contracts/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un contrato de servicios especializados
    #
    # Cambia lo que mande; lo demás queda. workers reemplaza la lista completa: para que alguien deje el contrato, póngale end_date en vez de quitarlo, así sigue en los informes de los meses que trabajó. Un contrato que terminó lleva su end_date.
    #
    # POST /v1/repse_contracts/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-repse-contract
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :number Número de contrato: dígitos, hasta 20 (así lo pide el SISUB).
    # @option params [String] :kind Tipo de contrato, como lo dice el contrato.
    # @option params [String] :contract_object Objeto del contrato.
    # @option params [String] :service El servicio u obra especializada registrado en el REPSE que cubre.
    # @option params [Numeric] :amount Monto pactado, en pesos.
    # @option params [String] :start_date Inicio de su vigencia (YYYY-MM-DD).
    # @option params [String] :end_date Fecha de término; null si es por tiempo indefinido.
    # @option params [Integer] :estimated_workers Número estimado mensual de trabajadores que pone a disposición.
    # @option params [String] :client_tax_id RFC del cliente (el beneficiario de los servicios).
    # @option params [String] :client_name Razón social del cliente.
    # @option params [String] :client_employer_registration Registro patronal del cliente ante el IMSS, si tiene.
    # @option params [Hash] :client_address Domicilio fiscal del cliente.
    # @option params [Hash] :site_address El centro de trabajo donde trabajan las personas que pone a disposición.
    # @option params [Array] :workers Quién trabaja en el contrato y desde cuándo (hasta 2,000).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/repse_contracts/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Archivar un contrato de servicios especializados
    #
    # Lo archiva: sale de la lista y de todos los informes, también de los pasados. Para un contrato que terminó, mejor póngale end_date con POST /v1/repse_contracts/{id}.
    #
    # DELETE /v1/repse_contracts/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-repse-contract
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/repse_contracts/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.repse_profile.
  class RepseProfileResource
    def initialize(client)
      @client = client
    end

    # Ver los datos del sujeto obligado
    #
    # Los datos del emisor que pide el SISUB del Infonavit y no están en Fiscalisto: folio del REPSE, correo, teléfono, domicilio, representante legal y, de una persona moral, su acta constitutiva y folio mercantil. Como «Datos del sujeto obligado» en «Nómina › REPSE».
    #
    # GET /v1/repse_profile
    # https://fiscalisto.com/docs/api/referencia/nomina/get-repse-profile
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/repse_profile", params, opts, kw, send: :query)
    end

    # Guardar los datos del sujeto obligado
    #
    # Cambia lo que mande; lo demás queda y "" lo vacía. El teléfono va con 10 dígitos y deed_date como AAAA-MM-DD; si no, contesta parameter_invalid en ese campo.
    #
    # POST /v1/repse_profile
    # https://fiscalisto.com/docs/api/referencia/nomina/update-repse-profile
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :stps_folio Folio de su registro en el REPSE que dio la STPS (AR65000).
    # @option params [String] :stps_registration_date Fecha en que la STPS otorgó el registro o su última renovación (YYYY-MM-DD).
    # @option params [String] :email Correo del sujeto obligado.
    # @option params [String] :phone Teléfono, 10 dígitos.
    # @option params [String] :address Domicilio fiscal en una línea: calle, números, colonia, C.P., municipio y estado.
    # @option params [String] :legal_representative Representante legal (persona moral).
    # @option params [String] :sole_administrator Administrador único, si tiene (persona moral).
    # @option params [String] :deed_number Número de la escritura constitutiva (persona moral).
    # @option params [String] :notary_name Nombre del notario público de la escritura.
    # @option params [String] :notary_number Número de la notaría.
    # @option params [String] :deed_date Fecha de la escritura (YYYY-MM-DD).
    # @option params [String] :commercial_folio Folio mercantil (persona moral).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/repse_profile", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.repse_returns.
  class RepseReturnsResource
    def initialize(client)
      @client = client
    end

    # Informes ICSOE y SISUB de un cuatrimestre
    #
    # Lo que se presenta del cuatrimestre (AAAA-1 enero a abril, AAAA-2 mayo a agosto, AAAA-3 septiembre a diciembre) a más tardar el día 17 del mes siguiente, o el siguiente día hábil: por contrato, sus trabajadores con NSS, CURP y último salario base de cotización (ICSOE, LSS art. 15-A), y por trabajador y bimestre las percepciones, el salario topado a 25 UMA, la aportación del 5% y la amortización de su crédito (SISUB, Ley del Infonavit art. 29 Bis), calculados de los recibos timbrados. files trae los archivos para subir: los tres del SISUB y uno del ICSOE por contrato. problems dice lo que falta para presentarlos.
    #
    # GET /v1/repse_returns/{period}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-repse-return
    #
    # @param period [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(period, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/repse_returns/#{Core.path(period)}", params, opts, kw, send: :query)
    end
  end

  # Nómina: fiscalisto.payroll_org_chart.
  class PayrollOrgChartResource
    def initialize(client)
      @client = client
    end

    # Organigrama
    #
    # Como «Nómina › Organigrama» de la app: los empleados de hoy del emisor con su jefe directo, departamento y sucursal, cuántas personas dependen de cada uno (directas y en toda su cadena), los departamentos con sus subdepartamentos, las vacantes y un resumen (jefes, tramo promedio, quién queda sin jefe o sin departamento). Quien no tiene jefe, o cuyo jefe ya se fue, queda arriba; un círculo que dejó una importación se rompe en el de número más bajo.
    #
    # GET /v1/payroll_org_chart
    # https://fiscalisto.com/docs/api/referencia/nomina/get-payroll-org-chart
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :as_of Un día pasado (YYYY-MM-DD): el organigrama como estaba al cierre de ese día, con los jefes, departamentos y s…
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payroll_org_chart", params, opts, kw, send: :query)
    end

    # Cambiar jefe, departamento o sucursal
    #
    # Cambia el jefe directo, el departamento o la sucursal de uno o varios empleados (hasta 500); lo que no manda no cambia. Un jefe que, subiendo por su cadena, depende de alguno de ellos contesta parameter_invalid: quedarían en círculo. El departamento es el que llevan sus recibos (Departamento). Contesta el organigrama ya cambiado.
    #
    # POST /v1/payroll_org_chart/assign
    # https://fiscalisto.com/docs/api/referencia/nomina/assign-payroll-org-chart
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Array] :employees (obligatorio) A quiénes (emp_…).
    # @option params [String] :manager Su jefe directo (emp_…), o null para ponerlos arriba.
    # @option params [String] :department Su departamento, como lo llevan sus recibos (Departamento), o null para ninguno.
    # @option params [String] :branch Una sucursal del emisor (brn_…), o null para la matriz.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def assign(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/assign", params, opts, kw, send: :body, idempotent: true)
    end

    # Crear o cambiar un departamento
    #
    # Crea el departamento name o, si ya existe, lo cambia: new_name lo renombra (también en sus empleados y vacantes), parent lo pone dentro de otro y lead le pone responsable. Un parent que ya está dentro de él contesta parameter_invalid. Contesta el organigrama.
    #
    # POST /v1/payroll_org_chart/departments
    # https://fiscalisto.com/docs/api/referencia/nomina/save-payroll-department
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) El departamento.
    # @option params [String] :new_name Su nuevo nombre: se cambia también en sus empleados y vacantes.
    # @option params [String] :parent El departamento dentro del que está, o null para ponerlo arriba.
    # @option params [String] :lead Su responsable (emp_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def save_department(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/departments", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar un departamento
    #
    # Quita un departamento sin personas; los que estaban dentro de él suben un nivel. Con personas contesta parameter_invalid: cámbielas antes con POST /v1/payroll_org_chart/assign. Contesta el organigrama.
    #
    # POST /v1/payroll_org_chart/departments/remove
    # https://fiscalisto.com/docs/api/referencia/nomina/remove-payroll-department
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Nombre.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def remove_department(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/departments/remove", params, opts, kw, send: :body, idempotent: true)
    end

    # Abrir una vacante
    #
    # Un puesto sin persona todavía, bajo un jefe, en un departamento y una sucursal, con el sueldo mensual que ofrece: sale en el organigrama, pero no cuenta como empleado. Queda en pending_approval hasta que alguien con el permiso «Aprobar la prenómina» la aprueba en la app (le llega un aviso); entonces se cubre con POST /v1/payroll_org_chart/vacancies/{id}/fill. Contesta el organigrama, con lo que costaría al mes (monthly_cost).
    #
    # POST /v1/payroll_org_chart/vacancies
    # https://fiscalisto.com/docs/api/referencia/nomina/create-payroll-vacancy
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :title (obligatorio) El puesto que falta cubrir.
    # @option params [String] :department Departamento (Departamento).
    # @option params [String] :manager Bajo qué jefe (emp_…).
    # @option params [String] :branch Una sucursal del emisor (brn_…), o null para la matriz.
    # @option params [String] :opened_on Desde cuándo está abierta (YYYY-MM-DD); por omisión hoy.
    # @option params [Numeric] :salary_min Sueldo mensual bruto que ofrece, desde (pesos); null si no lo dice.
    # @option params [Numeric] :salary_max Sueldo mensual bruto que ofrece, hasta (pesos); null si no lo dice.
    # @option params [String] :state Estado donde trabajará, como c_Estado (NLE, CMX…), para su impuesto sobre nómina; null para el de su jefe o e…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_vacancy(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/vacancies", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar una vacante
    #
    # Cambia el puesto, departamento, jefe, sucursal o sueldo de una vacante (vac_…); lo que no manda queda vacío. Cambiada, vuelve a pending_approval. Una ya cubierta contesta parameter_invalid.
    #
    # POST /v1/payroll_org_chart/vacancies/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-payroll-vacancy
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :title (obligatorio) El puesto que falta cubrir.
    # @option params [String] :department Departamento (Departamento).
    # @option params [String] :manager Bajo qué jefe (emp_…).
    # @option params [String] :branch Una sucursal del emisor (brn_…), o null para la matriz.
    # @option params [String] :opened_on Desde cuándo está abierta (YYYY-MM-DD); por omisión hoy.
    # @option params [Numeric] :salary_min Sueldo mensual bruto que ofrece, desde (pesos); null si no lo dice.
    # @option params [Numeric] :salary_max Sueldo mensual bruto que ofrece, hasta (pesos); null si no lo dice.
    # @option params [String] :state Estado donde trabajará, como c_Estado (NLE, CMX…), para su impuesto sobre nómina; null para el de su jefe o e…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_vacancy(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/vacancies/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Cerrar una vacante
    #
    # La quita del organigrama (se cubrió o ya no hace falta). Contesta el organigrama.
    #
    # DELETE /v1/payroll_org_chart/vacancies/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-payroll-vacancy
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_vacancy(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/payroll_org_chart/vacancies/#{Core.path(id)}", nil, opts, kw)
    end

    # Cubrir una vacante
    #
    # La cubre con un empleado ya dado de alta (POST /v1/employees): queda con el jefe, el departamento y la sucursal de la vacante, y la vacante sale del organigrama (status filled). Una que espera aprobación o se rechazó contesta parameter_invalid. Falta su alta en el IMSS (GET /v1/imss_movements la propone).
    #
    # POST /v1/payroll_org_chart/vacancies/{id}/fill
    # https://fiscalisto.com/docs/api/referencia/nomina/fill-payroll-vacancy
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) Quien la ocupa (emp_…), ya dado de alta con POST /v1/employees: queda con el jefe, el departamento y la sucur…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def fill_vacancy(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/vacancies/#{Core.path(id)}/fill", params, opts, kw, send: :body, idempotent: true)
    end

    # Publicar una vacante
    #
    # La pone en la página de empleos del emisor (published true) o la quita (false), con su descripción, requisitos, tipo de contrato, lugar, sueldo visible, fecha de cierre y el formulario (jbf_…) que llenan quienes se postulan. Solo una approved se publica; publicarla enciende la página si estaba apagada. Google la puede mostrar en sus resultados de empleos (JobPosting). Contesta hiring.
    #
    # POST /v1/payroll_org_chart/vacancies/{id}/publish
    # https://fiscalisto.com/docs/api/referencia/nomina/publish-payroll-vacancy
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Boolean] :published (obligatorio) true la pone en la página; false la quita.
    # @option params [String] :description Qué hará la persona; los párrafos van separados por una línea en blanco.
    # @option params [Array] :requirements Lo que pide, uno por renglón (escolaridad, experiencia…).
    # @option params [String] :employment_type full_time, part_time, fixed_term (por tiempo determinado), project (por obra determinada) o internship (práct…
    # @option params [String] :workplace Dónde se trabaja: on_site (presencial), hybrid (híbrido) o remote.
    # @option params [Boolean] :show_salary Si la página muestra el sueldo de la vacante (salary_min y salary_max).
    # @option params [String] :closes_on Hasta cuándo recibe solicitudes (YYYY-MM-DD).
    # @option params [String] :form El formulario que llenan (jbf_…); null el predeterminado.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def publish_vacancy(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payroll_org_chart/vacancies/#{Core.path(id)}/publish", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.hiring.
  class HiringResource
    def initialize(client)
      @client = client
    end

    # Página de empleos
    #
    # Como «Nómina › Empleos» de la app: la página de empleos del emisor (careers_url, si se ve, su texto, el correo de contacto), las etapas de sus candidatos, qué hacer con quien no cumple un requisito, sus formularios (jbf_…) y sus vacantes con lo que publican y cuántos candidatos hay en cada etapa.
    #
    # GET /v1/hiring
    # https://fiscalisto.com/docs/api/referencia/nomina/get-hiring
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/hiring", params, opts, kw, send: :query)
    end

    # Configurar la página de empleos
    #
    # Enciende o apaga la página, cambia su texto y correo de contacto, las etapas de los candidatos (al menos dos; la primera es donde llegan), unmet_requirements y el formulario predeterminado. Lo que no manda no cambia. Contesta hiring.
    #
    # POST /v1/hiring/settings
    # https://fiscalisto.com/docs/api/referencia/nomina/update-hiring-settings
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Boolean] :enabled Si la página de empleos se ve.
    # @option params [String] :intro El texto de arriba de la página: quiénes son y por qué trabajar ahí.
    # @option params [String] :contact_email El correo para dudas de quien se postula y para sus derechos ARCO (aviso de privacidad).
    # @option params [Array] :stages Las etapas de sus candidatos, en orden.
    # @option params [String] :unmet_requirements Qué hacer con quien no cumple un requisito: flag la recibe marcada; warn le dice qué no cumple antes de envia…
    # @option params [String] :default_form El formulario (jbf_…) de las vacantes que no eligen uno; null el básico.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_settings(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/hiring/settings", params, opts, kw, send: :body, idempotent: true)
    end

    # Crear un formulario de solicitud
    #
    # Las preguntas que llena quien se postula, del tipo que sea (texto, párrafo, número, fecha, lista, varias opciones, sí o no, correo, teléfono, enlace o archivo), obligatorias u opcionales, con sus reglas y las que son requisito. nombre y correo van siempre. Una pregunta que la Ley Federal del Trabajo no deja pedir (art. 133: edad, género, estado civil, embarazo…) se guarda, pero la app la señala.
    #
    # POST /v1/hiring/forms
    # https://fiscalisto.com/docs/api/referencia/nomina/create-job-form
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Cómo lo llama su equipo.
    # @option params [Array] :questions (obligatorio) Sus preguntas, en orden.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_form(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/hiring/forms", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar un formulario de solicitud
    #
    # Cambia su nombre y sus preguntas. Las solicitudes que ya llegaron conservan las preguntas que contestaron.
    #
    # POST /v1/hiring/forms/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-job-form
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Cómo lo llama su equipo.
    # @option params [Array] :questions (obligatorio) Sus preguntas, en orden.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_form(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/hiring/forms/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Archivar un formulario de solicitud
    #
    # Deja de usarse: sus vacantes piden el predeterminado desde ahora. Las solicitudes que ya llegaron no cambian.
    #
    # DELETE /v1/hiring/forms/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-job-form
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_form(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/hiring/forms/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.candidates.
  class CandidatesResource
    def initialize(client)
      @client = client
    end

    # Listar candidatos
    #
    # Las solicitudes que llegaron por la página de empleos, las más recientes primero, con sus respuestas, su etapa y los requisitos que no cumple.
    #
    # GET /v1/candidates
    # https://fiscalisto.com/docs/api/referencia/nomina/list-candidates
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :vacancy Solo las de una vacante (vac_…).
    # @option params [String] :stage Solo las de una etapa, como en stages de hiring.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/candidates", params, opts, kw)
    end

    # Ver un candidato
    #
    # Una solicitud (cnd_…), con las preguntas que contestó y sus archivos.
    #
    # GET /v1/candidates/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-candidate
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/candidates/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un candidato
    #
    # Lo pasa a otra etapa, lo califica (1 a 5) o le pone una nota de su equipo. Lo que no manda no cambia.
    #
    # POST /v1/candidates/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-candidate
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :stage Una de las etapas (stages).
    # @option params [Integer] :rating Su calificación, de 1 a 5; null se la quita.
    # @option params [String] :note La nota de su equipo; no la ve el candidato.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/candidates/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un candidato
    #
    # Borra la solicitud y sus archivos, por ejemplo cuando el candidato lo pide (derechos ARCO). No se puede deshacer.
    #
    # DELETE /v1/candidates/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-candidate
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/candidates/#{Core.path(id)}", nil, opts, kw)
    end

    # Contratar a un candidato
    #
    # Con el empleado ya dado de alta (POST /v1/employees), cubre la vacante de la solicitud (como POST /v1/payroll_org_chart/vacancies/{id}/fill), pasa al candidato a la etapa de contratados y quita la vacante de la página. Falta su alta en el IMSS.
    #
    # POST /v1/candidates/{id}/hire
    # https://fiscalisto.com/docs/api/referencia/nomina/hire-candidate
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…) que ya dio de alta con POST /v1/employees: cubre la vacante con él.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def hire(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/candidates/#{Core.path(id)}/hire", params, opts, kw, send: :body, idempotent: true)
    end

    # Descargar un archivo de un candidato
    #
    # El archivo que subió a una pregunta de tipo file (su CV, por ejemplo), tal como lo subió: PDF, JPG, PNG o Word. answers[].file.url de candidate lleva esta ruta.
    #
    # GET /v1/candidates/{id}/files/{question}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-candidate-file
    #
    # @param id [String]
    # @param question [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def file(id, question, opts = nil, **kw)
      @client.call("GET", "/v1/candidates/#{Core.path(id)}/files/#{Core.path(question)}", nil, opts, kw, result: :text)
    end
  end

  # Nómina: fiscalisto.training.
  class TrainingResource
    def initialize(client)
      @client = client
    end

    # Capacitación
    #
    # Como «Nómina › Capacitación» de la app: quién firma las constancias DC-3 (con hasta 50 trabajadores el patrón o su representante legal; con más, el representante del patrón y el de los trabajadores ante la comisión mixta: Acuerdo de la STPS del 14 de junio de 2013, artículo 24, fracción II), cuántos trabajadores cuenta, los años del plan de capacitación con el día límite del aviso a la STPS de cada uno (60 días hábiles, artículo 26, fracción I), las constancias por renovar y cuántas faltan por entregar.
    #
    # GET /v1/training
    # https://fiscalisto.com/docs/api/referencia/nomina/get-training
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/training", params, opts, kw, send: :query)
    end

    # Configurar la capacitación
    #
    # Quién firma las constancias, la comisión mixta (LFT 153-E: igual número por cada parte), cuántos trabajadores contar si no todos están en Nómina, las fechas del plan (dos años como máximo, LFT 153-H) y la ocupación del Catálogo Nacional de Ocupaciones de cada puesto. Lo que no manda no cambia. Contesta training.
    #
    # POST /v1/training/settings
    # https://fiscalisto.com/docs/api/referencia/nomina/update-training-settings
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :company_name El nombre de la empresa en la constancia; null usa la razón social.
    # @option params [String] :legal_rep Quien firma como patrón o representante legal cuando hay hasta 50 trabajadores (art.
    # @option params [String] :commission_employer_rep Con más de 50 trabajadores: el representante del patrón ante la comisión mixta de capacitación, que firma la…
    # @option params [String] :workers_rep Con más de 50 trabajadores: el representante de los trabajadores ante la comisión mixta, que también firma.
    # @option params [Array] :commission Los integrantes de la comisión mixta de capacitación (LFT 153-E: igual número por cada parte).
    # @option params [String] :commission_constituted_on El día en que se constituyó la comisión mixta.
    # @option params [Integer] :workers_count Los trabajadores de la empresa, si no todos están en Nómina; null cuenta los empleados activos.
    # @option params [String] :plan_start El día en que empieza el plan de capacitación (dos años como máximo, LFT 153-H).
    # @option params [String] :plan_end El día en que termina el plan.
    # @option params [Hash] :occupations La ocupación del Catálogo Nacional de Ocupaciones de cada puesto: {"Operador de montacargas": "06.2"}.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_settings(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training/settings", params, opts, kw, send: :body, idempotent: true)
    end

    # Constancias para el aviso a la STPS
    #
    # Las constancias DC-3 emitidas de los cursos que terminaron entre from y to, con lo que pide el aviso a la STPS (artículo 26, fracción I: nombre, CURP, ocupación, puesto, estudios, curso, área temática, horas, fechas y agente capacitador), ordenadas por folio. El día límite para presentarlo de cada año del plan viene en plan_years de GET /v1/training. El aviso se presenta en el sistema de la STPS, que no tiene API.
    #
    # GET /v1/training/certificates
    # https://fiscalisto.com/docs/api/referencia/nomina/list-training-certificates
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :from (obligatorio) Desde (AAAA-MM-DD), por la fecha de fin del curso.
    # @option params [String] :to (obligatorio) Hasta (AAAA-MM-DD).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def certificates(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/training/certificates", params, opts, kw, send: :query)
    end
  end

  # Nómina: fiscalisto.training_courses.
  class TrainingCoursesResource
    def initialize(client)
      @client = client
    end

    # Listar cursos de capacitación
    #
    # Los cursos del emisor (trc_…), los más recientes primero, con cuántos lo tomaron, aprobaron, tienen su constancia y faltan por entregar (due) o ya pasaron los 20 días hábiles (late).
    #
    # GET /v1/training_courses
    # https://fiscalisto.com/docs/api/referencia/nomina/list-training-courses
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/training_courses", params, opts, kw)
    end

    # Registrar un curso de capacitación
    #
    # Lo que pide la constancia DC-3 (artículo 24, fracción IV): nombre, área temática del catálogo de la STPS, horas, periodo y quién lo imparte (con un instructor interno la constancia dice el nombre de la empresa como agente capacitador), con quiénes lo tomaron (employees).
    #
    # POST /v1/training_courses
    # https://fiscalisto.com/docs/api/referencia/nomina/create-training-course
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) El nombre del curso, como va en la constancia.
    # @option params [String] :thematic_area (obligatorio) La clave del área temática del catálogo de la STPS (1000 Producción general … 9000 Participación social).
    # @option params [Numeric] :hours (obligatorio) La duración en horas.
    # @option params [String] :modality presencial (por omisión), en_linea o mixta.
    # @option params [String] :start_date (obligatorio) El día en que empezó.
    # @option params [String] :end_date (obligatorio) El día en que terminó; de ahí corren los 20 días hábiles para entregar las constancias.
    # @option params [String] :trainer_kind Quién lo imparte: internal (instructor interno, por omisión: la constancia dice el nombre de la empresa como…
    # @option params [String] :trainer_name El nombre del agente capacitador, salvo internal y stps.
    # @option params [String] :trainer_registration El registro del agente externo ante la STPS.
    # @option params [String] :instructor_name Quien firma la constancia como instructor o tutor.
    # @option params [Integer] :validity_months Cada cuántos meses se renueva (para avisar); null, sin vigencia.
    # @option params [Numeric] :passing_score La calificación mínima para aprobar (opcional).
    # @option params [String] :place Dónde se impartió.
    # @option params [String] :objective Su objetivo.
    # @option params [Array] :employees Quiénes lo tomaron (emp_…); en una actualización reemplaza la lista.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training_courses", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver un curso de capacitación
    #
    # Un curso (trc_…) con quienes lo tomaron (trp_…): su resultado, el folio de su constancia, el día límite para entregarla (20 días hábiles desde el fin del curso, artículo 24, fracción III), si ya se entregó y, cuando todavía no se puede emitir, por qué (blocker).
    #
    # GET /v1/training_courses/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-training-course
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/training_courses/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un curso de capacitación
    #
    # Cambia sus datos; employees reemplaza la lista (quien ya tiene su constancia se queda). Las constancias ya emitidas guardan lo que decían.
    #
    # POST /v1/training_courses/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-training-course
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) El nombre del curso, como va en la constancia.
    # @option params [String] :thematic_area (obligatorio) La clave del área temática del catálogo de la STPS (1000 Producción general … 9000 Participación social).
    # @option params [Numeric] :hours (obligatorio) La duración en horas.
    # @option params [String] :modality presencial (por omisión), en_linea o mixta.
    # @option params [String] :start_date (obligatorio) El día en que empezó.
    # @option params [String] :end_date (obligatorio) El día en que terminó; de ahí corren los 20 días hábiles para entregar las constancias.
    # @option params [String] :trainer_kind Quién lo imparte: internal (instructor interno, por omisión: la constancia dice el nombre de la empresa como…
    # @option params [String] :trainer_name El nombre del agente capacitador, salvo internal y stps.
    # @option params [String] :trainer_registration El registro del agente externo ante la STPS.
    # @option params [String] :instructor_name Quien firma la constancia como instructor o tutor.
    # @option params [Integer] :validity_months Cada cuántos meses se renueva (para avisar); null, sin vigencia.
    # @option params [Numeric] :passing_score La calificación mínima para aprobar (opcional).
    # @option params [String] :place Dónde se impartió.
    # @option params [String] :objective Su objetivo.
    # @option params [Array] :employees Quiénes lo tomaron (emp_…); en una actualización reemplaza la lista.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training_courses/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un curso de capacitación
    #
    # Lo borra si nadie tiene su constancia; si alguien la tiene, lo cancela (canceled true), porque las copias se conservan a disposición de la STPS (artículo 26, fracción III).
    #
    # DELETE /v1/training_courses/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-training-course
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/training_courses/#{Core.path(id)}", nil, opts, kw)
    end

    # Quién tomó un curso
    #
    # Reemplaza la lista de quienes lo tomaron (emp_…). Quien ya tiene su constancia se queda.
    #
    # POST /v1/training_courses/{id}/participants
    # https://fiscalisto.com/docs/api/referencia/nomina/set-training-participants
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :employees (obligatorio) Los empleados (emp_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set_participants(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training_courses/#{Core.path(id)}/participants", params, opts, kw, send: :body, idempotent: true)
    end

    # Calificar un curso
    #
    # El resultado de cada quien: pending, passed, failed o sufficiency (aprobó el examen de suficiencia, artículo 24, fracción III, inciso b), con su calificación. A quien ya tiene su constancia no se le puede poner failed.
    #
    # POST /v1/training_courses/{id}/results
    # https://fiscalisto.com/docs/api/referencia/nomina/set-training-results
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :results (obligatorio) La calificación de cada empleado, hasta 1,000 a la vez.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set_results(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training_courses/#{Core.path(id)}/results", params, opts, kw, send: :body, idempotent: true)
    end

    # Emitir constancias DC-3
    #
    # Emite la constancia de quienes aprobaron (o de los que mande en employees), cada una con el folio siguiente del emisor. Pide que el curso haya terminado (salvo el examen de suficiencia), el CURP y la ocupación de cada quien y quién firma; lo que falte se lee en blocker de cada participante.
    #
    # POST /v1/training_courses/{id}/issue
    # https://fiscalisto.com/docs/api/referencia/nomina/issue-training-certificates
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :employees A quiénes; por omisión a todos los que aprobaron y no la tienen.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def issue(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training_courses/#{Core.path(id)}/issue", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar constancias como entregadas
    #
    # Anota que se entregaron (en papel, por correo o en el portal del empleado) y el día. Por omisión todas las emitidas sin entregar.
    #
    # POST /v1/training_courses/{id}/deliver
    # https://fiscalisto.com/docs/api/referencia/nomina/deliver-training-certificates
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :employees A quiénes se entregó; por omisión todas las emitidas sin entregar.
    # @option params [String] :delivered_on El día de la entrega; por omisión hoy.
    # @option params [String] :via Cómo: paper (en papel, por omisión), email o portal.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def deliver(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/training_courses/#{Core.path(id)}/deliver", params, opts, kw, send: :body, idempotent: true)
    end

    # Descargar constancias DC-3
    #
    # Las constancias emitidas del curso en el formato DC-3 de la STPS, una página cada una con su reverso de catálogos, listas para firmar. El logo de la empresa va si lo tiene (artículo 25: solo logotipos).
    #
    # GET /v1/training_courses/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/nomina/get-training-certificates-pdf
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :employees Solo las de estos empleados (emp_…, separados por comas).
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/training_courses/#{Core.path(id)}/pdf", params, opts, kw, send: :query, result: :bytes)
    end
  end

  # Nómina: fiscalisto.climate.
  class ClimateResource
    def initialize(client)
      @client = client
    end

    # Clima laboral
    #
    # Como «Nómina › Clima laboral» de la app: la política de prevención de riesgos psicosociales y cuántos la leyeron (NOM-035-STPS-2018, numerales 5.1 y 5.7), cada centro de trabajo con la guía que le toca por cuántos trabajan ahí (numeral 7.1) y cuándo le toca la siguiente identificación (cada dos años como mínimo, numeral 7.9), cuántas acciones del Programa de intervención faltan y cuántas quejas del buzón esperan atención.
    #
    # GET /v1/climate
    # https://fiscalisto.com/docs/api/referencia/nomina/get-climate
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/climate", params, opts, kw, send: :query)
    end

    # Guardar la política de prevención
    #
    # El texto de la política (numeral 5.1) y con quién más presentar una queja. Con publish true la publica en el portal de cada trabajador como una versión nueva (numeral 5.7) y se les pide leerla otra vez. Lo que no manda no cambia. Contesta climate.
    #
    # POST /v1/climate/policy
    # https://fiscalisto.com/docs/api/referencia/nomina/update-climate-policy
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :policy El texto de la política de prevención de riesgos psicosociales (numeral 5.1).
    # @option params [String] :complaints_contact Con quién más pueden presentar una queja, además del buzón del portal (Recursos Humanos, por ejemplo).
    # @option params [Boolean] :publish true la publica en el portal de cada trabajador (numeral 5.7) como una versión nueva, que se les pide leer ot…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_policy(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate/policy", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.climate_surveys.
  class ClimateSurveysResource
    def initialize(client)
      @client = client
    end

    # Listar encuestas de clima laboral
    #
    # Las encuestas NOM-035 y de clima del emisor (cls_…), las más recientes primero, con a cuántos se les pidió y cuántos contestaron.
    #
    # GET /v1/climate_surveys
    # https://fiscalisto.com/docs/api/referencia/nomina/list-climate-surveys
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/climate_surveys", params, opts, kw)
    end

    # Crear una encuesta de clima laboral
    #
    # kind nom035 aplica la guía que le toca al centro de trabajo por cuántos trabajan ahí hoy: la Guía II de 16 a 50 y la Guía III con más de 50 (numeral 7.1), y la Guía I para identificar a quien vivió un acontecimiento traumático severo (numeral 5.5). Un centro tiene una sola encuesta NOM-035 abierta a la vez. kind clima es una encuesta propia con sus preguntas (scale, nps para el eNPS, choice o text). Queda en borrador salvo con open true. Las respuestas llegan solo desde el portal del empleado y nunca con nombre.
    #
    # POST /v1/climate_surveys
    # https://fiscalisto.com/docs/api/referencia/nomina/create-climate-survey
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :kind (obligatorio) nom035 (las guías de la norma por centro de trabajo) o clima (una encuesta propia con sus preguntas).
    # @option params [String] :title Su nombre; por omisión «NOM-035 2026» o «Encuesta de clima 2026».
    # @option params [String] :branch El centro de trabajo: una sucursal (brn_…).
    # @option params [Boolean] :guide_i NOM-035: también pregunta la Guía I, para identificar a quien vivió un acontecimiento traumático severo (nume…
    # @option params [Boolean] :sample NOM-035 con la Guía III (más de 50 trabajadores): la aplica a una muestra elegida al azar según la Ecuación 1…
    # @option params [Array] :questions Encuesta de clima: sus preguntas, en orden.
    # @option params [String] :closes_on La fecha límite para contestar (opcional).
    # @option params [Boolean] :open true la abre de una vez: invita a quien trabaja hoy en ese centro y aparece en su portal.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_surveys", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver una encuesta de clima laboral
    #
    # La encuesta con sus resultados: con la NOM-035, la calificación final y la de cada categoría y dominio con su nivel de riesgo según las tablas de la norma, y si pide un Programa de intervención (de medio para arriba, numeral 8.3); con la de clima, cada pregunta y el eNPS. Los resultados se muestran desde 5 respuestas (hidden true antes), y los departamentos con menos se dejan fuera, para que no se distinga lo que contestó cada quien. invites dice a quién se le pidió y si ya contestó, no qué.
    #
    # GET /v1/climate_surveys/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-climate-survey
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/climate_surveys/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar una encuesta de clima laboral
    #
    # Cambia un borrador. Una encuesta abierta o cerrada ya no cambia, porque hay quien contestó esas preguntas: ciérrela y haga otra.
    #
    # POST /v1/climate_surveys/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-climate-survey
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :kind (obligatorio) nom035 (las guías de la norma por centro de trabajo) o clima (una encuesta propia con sus preguntas).
    # @option params [String] :title Su nombre; por omisión «NOM-035 2026» o «Encuesta de clima 2026».
    # @option params [String] :branch El centro de trabajo: una sucursal (brn_…).
    # @option params [Boolean] :guide_i NOM-035: también pregunta la Guía I, para identificar a quien vivió un acontecimiento traumático severo (nume…
    # @option params [Boolean] :sample NOM-035 con la Guía III (más de 50 trabajadores): la aplica a una muestra elegida al azar según la Ecuación 1…
    # @option params [Array] :questions Encuesta de clima: sus preguntas, en orden.
    # @option params [String] :closes_on La fecha límite para contestar (opcional).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_surveys/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una encuesta de clima laboral
    #
    # La borra si nadie la ha contestado. Con respuestas se conserva: los resultados se guardan al menos un año (numeral 5.8).
    #
    # DELETE /v1/climate_surveys/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-climate-survey
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/climate_surveys/#{Core.path(id)}", nil, opts, kw)
    end

    # Abrir una encuesta de clima laboral
    #
    # Invita a quien trabaja hoy en el centro (o a la muestra, con sample) y la encuesta aparece en su portal. Con la NOM-035 no se abre si el centro ya tiene otra abierta.
    #
    # POST /v1/climate_surveys/{id}/open
    # https://fiscalisto.com/docs/api/referencia/nomina/open-climate-survey
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def open(id, opts = nil, **kw)
      @client.call("POST", "/v1/climate_surveys/#{Core.path(id)}/open", nil, opts, kw, idempotent: true)
    end

    # Cerrar una encuesta de clima laboral
    #
    # Deja de recibir respuestas. Una NOM-035 cerrada cuenta como la identificación del centro de trabajo, y la siguiente toca dos años después (numeral 7.9).
    #
    # POST /v1/climate_surveys/{id}/close
    # https://fiscalisto.com/docs/api/referencia/nomina/close-climate-survey
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def close(id, opts = nil, **kw)
      @client.call("POST", "/v1/climate_surveys/#{Core.path(id)}/close", nil, opts, kw, idempotent: true)
    end

    # Guardar el informe de una encuesta
    #
    # Solo de la NOM-035: lo que pide el informe de resultados además de lo que calcula Fiscalisto (numeral 7.7): domicilio y actividad del centro, objetivo, actividades, conclusiones y el responsable de la evaluación. Lo que no manda no cambia.
    #
    # POST /v1/climate_surveys/{id}/report
    # https://fiscalisto.com/docs/api/referencia/nomina/update-climate-survey-report
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :address El domicilio del centro de trabajo (numeral 7.7 b)).
    # @option params [String] :activity Su actividad principal.
    # @option params [String] :objective El objetivo de la evaluación.
    # @option params [String] :activities Las principales actividades que se hacen ahí.
    # @option params [String] :conclusions Las conclusiones (numeral 7.7 g)).
    # @option params [String] :responsible El responsable de la evaluación.
    # @option params [String] :license Su cédula profesional, si la tiene.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_report(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_surveys/#{Core.path(id)}/report", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar acontecimientos traumáticos
    #
    # Quienes contestaron «Sí» en la Guía I, con su nombre, porque el patrón debe canalizar a quien lo requiera para su atención (numeral 5.5), y si requiere valoración clínica según la guía. Es lo único de una encuesta que lleva nombre.
    #
    # GET /v1/climate_surveys/{id}/traumatic_events
    # https://fiscalisto.com/docs/api/referencia/nomina/list-climate-traumatic-events
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def traumatic_events(id, opts = nil, **kw)
      @client.call("GET", "/v1/climate_surveys/#{Core.path(id)}/traumatic_events", nil, opts, kw)
    end

    # Anotar a dónde se canalizó a un trabajador
    #
    # A dónde se canalizó a quien vivió un acontecimiento traumático severo (el IMSS, un médico, un psicólogo), cuándo y una nota. Lo que no manda se borra.
    #
    # POST /v1/climate_surveys/{id}/referrals
    # https://fiscalisto.com/docs/api/referencia/nomina/refer-climate-traumatic-event
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) Quien vivió el acontecimiento (emp_…), de GET /v1/climate_surveys/{id}/traumatic_events.
    # @option params [String] :referred_to A dónde se le canalizó: el IMSS, un médico, un psicólogo.
    # @option params [String] :referred_on Cuándo.
    # @option params [String] :note Una nota.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def refer(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_surveys/#{Core.path(id)}/referrals", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.climate_actions.
  class ClimateActionsResource
    def initialize(client)
      @client = client
    end

    # Listar acciones del Programa de intervención
    #
    # Las acciones del emisor (cla_…), las pendientes primero y por fecha, o solo las de una encuesta con survey.
    #
    # GET /v1/climate_actions
    # https://fiscalisto.com/docs/api/referencia/nomina/list-climate-actions
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :survey Solo las de esta encuesta (cls_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/climate_actions", params, opts, kw)
    end

    # Agregar una acción del Programa de intervención
    #
    # Lo que pide el programa (numeral 8.4): el área que atiende, la acción, su nivel (primer nivel la organización, segundo los grupos, tercero cada persona, numeral 8.5), el responsable y la fecha. Al marcarla done se anota el día, y evaluation dice cómo resultó.
    #
    # POST /v1/climate_actions
    # https://fiscalisto.com/docs/api/referencia/nomina/create-climate-action
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :survey La encuesta de la que sale (cls_…), si sale de una.
    # @option params [String] :area (obligatorio) La categoría o el dominio que atiende (su clave en results), o un texto libre.
    # @option params [String] :level El nivel de la acción (numeral 8.5): primer (la organización, por omisión), segundo (grupos) o tercer (cada p…
    # @option params [String] :action (obligatorio) Qué se va a hacer.
    # @option params [String] :owner El responsable.
    # @option params [String] :due_on Para cuándo.
    # @option params [String] :status pending (por omisión), in_progress o done.
    # @option params [String] :evaluation Al terminarla: cómo resultó (numeral 8.4 c)).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_actions", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar una acción del Programa de intervención
    #
    # Reemplaza la acción con lo que manda: lo que no manda queda vacío o con su valor por omisión.
    #
    # POST /v1/climate_actions/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-climate-action
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :survey La encuesta de la que sale (cls_…), si sale de una.
    # @option params [String] :area (obligatorio) La categoría o el dominio que atiende (su clave en results), o un texto libre.
    # @option params [String] :level El nivel de la acción (numeral 8.5): primer (la organización, por omisión), segundo (grupos) o tercer (cada p…
    # @option params [String] :action (obligatorio) Qué se va a hacer.
    # @option params [String] :owner El responsable.
    # @option params [String] :due_on Para cuándo.
    # @option params [String] :status pending (por omisión), in_progress o done.
    # @option params [String] :evaluation Al terminarla: cómo resultó (numeral 8.4 c)).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_actions/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una acción del Programa de intervención
    #
    # La borra. No se puede deshacer.
    #
    # DELETE /v1/climate_actions/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-climate-action
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/climate_actions/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.climate_complaints.
  class ClimateComplaintsResource
    def initialize(client)
      @client = client
    end

    # Listar quejas del buzón
    #
    # Las quejas que mandaron los trabajadores desde su portal (numeral 8.1 b)): de violencia laboral, del entorno u otra. Llevan nombre solo si quien la mandó la firmó.
    #
    # GET /v1/climate_complaints
    # https://fiscalisto.com/docs/api/referencia/nomina/list-climate-complaints
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo las nueva, en_atencion o atendida.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/climate_complaints", params, opts, kw)
    end

    # Atender una queja del buzón
    #
    # Su estado y qué se hizo. Al marcarla atendida se anota el día. Lo que no manda no cambia.
    #
    # POST /v1/climate_complaints/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-climate-complaint
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :status nueva, en_atencion o atendida.
    # @option params [String] :note Qué se hizo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/climate_complaints/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Nómina: fiscalisto.review_cycles.
  class ReviewCyclesResource
    def initialize(client)
      @client = client
    end

    # Listar ciclos de evaluación
    #
    # Los ciclos de evaluación de desempeño del emisor (rvc_…), los más recientes primero, con cuántas personas y cuántas evaluaciones van enviadas.
    #
    # GET /v1/review_cycles
    # https://fiscalisto.com/docs/api/referencia/nomina/list-review-cycles
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/review_cycles", params, opts, kw)
    end

    # Crear un ciclo de evaluación
    #
    # Lo crea en borrador con todas las personas que trabajan hoy en el emisor, o en la sucursal o el departamento que diga. Ninguna ley pide evaluar el desempeño, así que la escala, quién evalúa, los pesos y las competencias los decide usted; lo que no manda toma los valores por omisión. Ábralo con POST /v1/review_cycles/{id}/open.
    #
    # POST /v1/review_cycles
    # https://fiscalisto.com/docs/api/referencia/nomina/create-review-cycle
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :title (obligatorio) Su nombre, como «Evaluación 2026».
    # @option params [String] :period_start Desde cuándo se evalúa.
    # @option params [String] :period_end Hasta cuándo.
    # @option params [String] :closes_on La fecha límite para contestar que ve cada evaluador (opcional).
    # @option params [Hash] :rules Cómo se califica.
    # @option params [Array] :competencies Lo que se califica de cada persona.
    # @option params [Integer] :peers_count Con peer: cuántos compañeros se toman al azar, entre quienes tienen el mismo jefe, para quien no tenga elegid…
    # @option params [Boolean] :share_results Al cerrar, cada persona ve su resultado en su portal.
    # @option params [String] :branch Solo quien trabaja en esta sucursal (brn_…).
    # @option params [String] :department Solo quien es de este departamento.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver un ciclo de evaluación
    #
    # El ciclo con sus reglas, competencias y cada persona: su jefe, quién la evalúa y si ya envió su evaluación (no qué contestó), sus objetivos y su resultado. Con el ciclo abierto el resultado se calcula con lo que va llegando; al cerrarlo queda guardado.
    #
    # GET /v1/review_cycles/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-review-cycle
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/review_cycles/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un ciclo de evaluación
    #
    # En borrador cambia todo. Abierto, solo el nombre, el periodo, la fecha límite, compañeros por persona y share_results: la escala, las competencias y quién evalúa ya no cambian porque hay quien ya contestó con ellas. Cerrado ya no cambia.
    #
    # POST /v1/review_cycles/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-review-cycle
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :title (obligatorio) Su nombre, como «Evaluación 2026».
    # @option params [String] :period_start Desde cuándo se evalúa.
    # @option params [String] :period_end Hasta cuándo.
    # @option params [String] :closes_on La fecha límite para contestar que ve cada evaluador (opcional).
    # @option params [Hash] :rules Cómo se califica.
    # @option params [Array] :competencies Lo que se califica de cada persona.
    # @option params [Integer] :peers_count Con peer: cuántos compañeros se toman al azar, entre quienes tienen el mismo jefe, para quien no tenga elegid…
    # @option params [Boolean] :share_results Al cerrar, cada persona ve su resultado en su portal.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un ciclo de evaluación
    #
    # Lo borra con sus personas y objetivos si nadie ha enviado una evaluación. Con evaluaciones, ciérrelo.
    #
    # DELETE /v1/review_cycles/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-review-cycle
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/review_cycles/#{Core.path(id)}", nil, opts, kw)
    end

    # Abrir un ciclo de evaluación
    #
    # Arma quién evalúa a quién: la persona misma, su jefe en el organigrama, sus compañeros (los elegidos o, si no, peers_count al azar entre quienes tienen el mismo jefe) y las personas a su cargo, según rules.raters. A cada evaluador le aparece en su portal lo que le toca, con el aviso review si lo tiene encendido.
    #
    # POST /v1/review_cycles/{id}/open
    # https://fiscalisto.com/docs/api/referencia/nomina/open-review-cycle
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def open(id, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles/#{Core.path(id)}/open", nil, opts, kw, idempotent: true)
    end

    # Cerrar un ciclo de evaluación
    #
    # Deja de recibir evaluaciones y guarda el resultado de cada persona como quedó. Con share_results, cada persona lo ve en su portal.
    #
    # POST /v1/review_cycles/{id}/close
    # https://fiscalisto.com/docs/api/referencia/nomina/close-review-cycle
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def close(id, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles/#{Core.path(id)}/close", nil, opts, kw, idempotent: true)
    end

    # Elegir a quién se evalúa
    #
    # En borrador: reemplaza la lista de personas del ciclo. Quien sale pierde sus objetivos en el ciclo.
    #
    # POST /v1/review_cycles/{id}/participants
    # https://fiscalisto.com/docs/api/referencia/nomina/set-review-participants
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :employees (obligatorio) Todas las personas que se evalúan (emp_…), en borrador.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set_participants(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles/#{Core.path(id)}/participants", params, opts, kw, send: :body, idempotent: true)
    end

    # Elegir los compañeros que evalúan a alguien
    #
    # Los compañeros que evalúan a una persona. Con el ciclo abierto agrega las evaluaciones de los nuevos y quita las que no se han enviado de los que salen.
    #
    # POST /v1/review_cycles/{id}/peers
    # https://fiscalisto.com/docs/api/referencia/nomina/set-review-peers
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) La persona que se evalúa (emp_…).
    # @option params [Array] :peers (obligatorio) Los compañeros que la evalúan (emp_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set_peers(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles/#{Core.path(id)}/peers", params, opts, kw, send: :body, idempotent: true)
    end

    # Calibrar el resultado de una persona
    #
    # Con el ciclo abierto o cerrado: una calificación calibrada en lugar de la calculada (con la nota de por qué cambia) y su potencial para la matriz de 9 cuadros. Lo que no manda no cambia.
    #
    # POST /v1/review_cycles/{id}/calibrations
    # https://fiscalisto.com/docs/api/referencia/nomina/calibrate-review
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) La persona (emp_…).
    # @option params [Numeric] :calibrated La calificación calibrada, en la escala del ciclo; null usa la calculada.
    # @option params [String] :note Por qué cambia; se pide con calibrated.
    # @option params [Integer] :potential El potencial para la matriz de 9 cuadros: 1 bajo, 2 medio, 3 alto.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def calibrate(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_cycles/#{Core.path(id)}/calibrations", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver el resultado de una persona
    #
    # Su calificación por competencia y por tipo de evaluador, y los comentarios. Compañeros y personas a su cargo se promedian juntos y nunca llevan nombre; con menos respuestas que rules.anonymous_min no cuentan ni se muestran.
    #
    # GET /v1/review_cycles/{id}/results/{employee}
    # https://fiscalisto.com/docs/api/referencia/nomina/get-review-result
    #
    # @param id [String]
    # @param employee [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def result(id, employee, opts = nil, **kw)
      @client.call("GET", "/v1/review_cycles/#{Core.path(id)}/results/#{Core.path(employee)}", nil, opts, kw)
    end
  end

  # Nómina: fiscalisto.review_objectives.
  class ReviewObjectivesResource
    def initialize(client)
      @client = client
    end

    # Agregar un objetivo
    #
    # Un objetivo de una persona en un ciclo, con su meta, unidad y peso (hasta 20 por persona). Su jefe lo califica al evaluarla y la persona anota su avance en su portal. Ya no se agregan cuando el jefe la evaluó.
    #
    # POST /v1/review_objectives
    # https://fiscalisto.com/docs/api/referencia/nomina/create-review-objective
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :cycle (obligatorio) El ciclo (rvc_…).
    # @option params [String] :employee (obligatorio) La persona (emp_…).
    # @option params [String] :title (obligatorio) Qué tiene que lograr.
    # @option params [Numeric] :target La meta, si se mide con un número.
    # @option params [Numeric] :actual El avance.
    # @option params [String] :unit La unidad: pesos, %, piezas.
    # @option params [Boolean] :lower_better La meta es un máximo (quejas, mermas): menos es mejor.
    # @option params [Numeric] :weight Cuánto cuenta frente a sus otros objetivos.
    # @option params [String] :note Una nota.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_objectives", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar un objetivo
    #
    # Reemplaza el objetivo con lo que manda: lo que no manda queda vacío o con su valor por omisión.
    #
    # POST /v1/review_objectives/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/update-review-objective
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :title (obligatorio) Qué tiene que lograr.
    # @option params [Numeric] :target La meta, si se mide con un número.
    # @option params [Numeric] :actual El avance.
    # @option params [String] :unit La unidad: pesos, %, piezas.
    # @option params [Boolean] :lower_better La meta es un máximo (quejas, mermas): menos es mejor.
    # @option params [Numeric] :weight Cuánto cuenta frente a sus otros objetivos.
    # @option params [String] :note Una nota.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/review_objectives/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un objetivo
    #
    # Lo borra, salvo que su jefe ya lo haya calificado.
    #
    # DELETE /v1/review_objectives/{id}
    # https://fiscalisto.com/docs/api/referencia/nomina/delete-review-objective
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/review_objectives/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Lotes: fiscalisto.invoice_batches.
  class InvoiceBatchesResource
    def initialize(client)
      @client = client
    end

    # Timbrar un lote de facturas
    #
    # Hasta 1,000 facturas de ingreso de un emisor, timbradas en segundo plano. Se revisan todas antes de empezar: si una no pasa, no se timbra ninguna. Responde 202; escuche invoice_batch.completed o consulte el lote.
    #
    # POST /v1/invoice_batches
    # https://fiscalisto.com/docs/api/referencia/lotes/create-invoice-batch
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :name Nombre del lote, para usted.
    # @option params [Array] :invoices (obligatorio) Las facturas, como el cuerpo de POST /v1/invoices, con reference opcional.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invoice_batches", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar lotes
    #
    # Los lotes de facturas, los más recientes primero, con cuántas se timbraron y cuántas fallaron.
    #
    # GET /v1/invoice_batches
    # https://fiscalisto.com/docs/api/referencia/lotes/list-invoice-batches
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/invoice_batches", params, opts, kw)
    end

    # Ver un lote
    #
    # Con cada factura: su estado, su id y su error.
    #
    # GET /v1/invoice_batches/{id}
    # https://fiscalisto.com/docs/api/referencia/lotes/get-invoice-batch
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/invoice_batches/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Clientes: fiscalisto.tax_ids.
  class TaxIdsResource
    def initialize(client)
      @client = client
    end

    # Validar los datos fiscales de un cliente
    #
    # Antes de timbrar: si el RFC, el nombre, el régimen, el código postal y el uso van a pasar. Sin cif_id revisa lo que se puede revisar sin el SAT (formato, régimen para ese tipo de persona, código postal en el catálogo, uso para el régimen, nombre sin «S.A. de C.V.») y las listas del SAT. Con el idCIF de la constancia lee el registro del SAT y compara nombre, código postal y régimen, como hará el PAC. No usa timbres.
    #
    # POST /v1/tax_ids/validate
    # https://fiscalisto.com/docs/api/referencia/clientes/validate-tax-id
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :tax_id (obligatorio) El RFC del cliente.
    # @option params [String] :legal_name El nombre o razón social que va a poner en la factura.
    # @option params [String] :tax_system Su régimen fiscal (c_RegimenFiscal), como 601 o 612.
    # @option params [String] :zip El código postal de su domicilio fiscal.
    # @option params [String] :use El uso del CFDI (c_UsoCFDI), como G03.
    # @option params [String] :cif_id El idCIF de su constancia de situación fiscal (11 dígitos, arriba a la izquierda, junto al QR).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def validate(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/tax_ids/validate", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Sucursales: fiscalisto.branches.
  class BranchesResource
    def initialize(client)
      @client = client
    end

    # Crear una sucursal
    #
    # Otro lugar desde donde factura el emisor, con su propio código postal: sus facturas llevan ese CP en LugarExpedicion (y su zona horaria en la Fecha, y el IVA 8 % si es de la franja fronteriza), su dirección en el PDF y, si las da, sus propias series. Varias sucursales pueden tener el mismo CP (dos locales en una plaza), incluso el del domicilio fiscal del emisor: cada factura recuerda de cuál salió. Hasta 200 por emisor.
    #
    # POST /v1/branches
    # https://fiscalisto.com/docs/api/referencia/sucursales/create-branch
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Cómo la llama su equipo, por ejemplo «Sucursal Monterrey».
    # @option params [String] :zip (obligatorio) Su código postal (LugarExpedicion de sus CFDI).
    # @option params [Hash] :address La dirección que va en el PDF de sus facturas.
    # @option params [String] :phone Teléfono, para el PDF.
    # @option params [String] :email Correo, para el PDF.
    # @option params [Hash] :series La serie de cada tipo de CFDI que se timbra desde ella (invoice, credit_note, payment, transfer), hasta 25 ca…
    # @option params [String] :trade_name Su nombre comercial, si se presenta con otra marca: va en grande en el PDF de lo que se factura desde ella, e…
    # @option params [String] :pdf_color Color del PDF de sus facturas, como #2563EB.
    # @option params [String] :pdf_style Estilo del PDF de sus facturas: clasico, moderno, compacto o minimalista.
    # @option params [String] :time_zone Su zona horaria (IANA), cuando no es la de su código postal: cuándo empieza su día para «hoy», los límites po…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/branches", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar sucursales
    #
    # Las sucursales del emisor, las más recientes primero. Las archivadas solo con include_archived=true.
    #
    # GET /v1/branches
    # https://fiscalisto.com/docs/api/referencia/sucursales/list-branches
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Boolean] :include_archived true para incluir las archivadas.
    # @option params [String] :zip Solo la de este código postal.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/branches", params, opts, kw)
    end

    # Ver una sucursal
    #
    # Una sucursal del emisor.
    #
    # GET /v1/branches/{id}
    # https://fiscalisto.com/docs/api/referencia/sucursales/get-branch
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/branches/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una sucursal
    #
    # Cambia solo los campos que manda; una serie en null vuelve a la del emisor. archived: true la archiva (ya no se factura desde ella y sus facturas la siguen nombrando), false la restaura. El código postal de una sucursal que ya facturó no cambia: si se mudó, archívela y cree otra.
    #
    # POST /v1/branches/{id}
    # https://fiscalisto.com/docs/api/referencia/sucursales/update-branch
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Cómo la llama su equipo, por ejemplo «Sucursal Monterrey».
    # @option params [String] :zip Su código postal (LugarExpedicion de sus CFDI).
    # @option params [Hash] :address La dirección que va en el PDF de sus facturas.
    # @option params [String] :phone Teléfono, para el PDF.
    # @option params [String] :email Correo, para el PDF.
    # @option params [Hash] :series La serie de cada tipo de CFDI que se timbra desde ella (invoice, credit_note, payment, transfer), hasta 25 ca…
    # @option params [String] :trade_name Su nombre comercial, si se presenta con otra marca: va en grande en el PDF de lo que se factura desde ella, e…
    # @option params [String] :pdf_color Color del PDF de sus facturas, como #2563EB.
    # @option params [String] :pdf_style Estilo del PDF de sus facturas: clasico, moderno, compacto o minimalista.
    # @option params [String] :time_zone Su zona horaria (IANA), cuando no es la de su código postal: cuándo empieza su día para «hoy», los límites po…
    # @option params [Boolean] :archived true la archiva: ya no se puede facturar desde ella, y sus facturas la siguen nombrando.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/branches/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una sucursal
    #
    # Solo una que nunca facturó; con facturas contesta branch_has_invoices: archívela con archived: true.
    #
    # DELETE /v1/branches/{id}
    # https://fiscalisto.com/docs/api/referencia/sucursales/delete-branch
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/branches/#{Core.path(id)}", nil, opts, kw)
    end

    # Subir el logo de la sucursal
    #
    # El logo de la sucursal (PNG o JPG de hasta 1 MB, en base64): va en lo que factura desde ella y en el portal de autofactura de los tickets que la nombran. Reemplaza el anterior; sin logo propio usa el del emisor.
    #
    # POST /v1/branches/{id}/logo
    # https://fiscalisto.com/docs/api/referencia/sucursales/upload-branch-logo
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :file (obligatorio) El logo, PNG o JPG de hasta 1 MB, en base64 (con o sin el prefijo data:image/png;base64,).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def upload_logo(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/branches/#{Core.path(id)}/logo", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar el logo de la sucursal
    #
    # Lo que factura y sus tickets vuelven al logo del emisor. Sin logo contesta 404.
    #
    # DELETE /v1/branches/{id}/logo
    # https://fiscalisto.com/docs/api/referencia/sucursales/delete-branch-logo
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_logo(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/branches/#{Core.path(id)}/logo", nil, opts, kw)
    end
  end

  # Reglas: fiscalisto.rules.
  class RulesResource
    def initialize(client)
      @client = client
    end

    # Crear una regla
    #
    # Cuando pasa trigger, si se cumplen conditions, hace actions. Corre desde ese momento con lo que llegue; no cambia lo que ya existe. Va al final del orden de su empresa. Lo que no se puede guardar contesta rule_invalid con el porqué (una acción que no va con su trigger, una etiqueta o centro de costo que no existe).
    #
    # POST /v1/rules
    # https://fiscalisto.com/docs/api/referencia/reglas/create-rule
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name Cómo se llama en Ajustes › Reglas.
    # @option params [String] :trigger (obligatorio) Cuándo corre: invoice.received (llega una factura de un proveedor), invoice.issued (se emite una factura), in…
    # @option params [Hash] :conditions Si: lo que tiene que cumplir.
    # @option params [Array] :actions (obligatorio) Entonces: de 1 a 8, en este orden.
    # @option params [Array] :else_actions Si no: de 0 a 8 acciones, las mismas de actions, que hace cuando sus condiciones no se cumplen.
    # @option params [Boolean] :once_per_record true: corre una sola vez por factura, orden o movimiento.
    # @option params [Integer] :wait_days Esperar y volver a revisar: si se cumple, espera estos días (1 a 90) y revisa de nuevo el registro como esté…
    # @option params [Array] :follow_ups Si sigue así: hasta 5 pasos días después de que actuó (recordatorios, escalar).
    # @option params [Boolean] :stop_after true: si se cumple, las reglas que siguen no corren para ese registro.
    # @option params [Boolean] :enabled false la deja en pausa.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/rules", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar reglas
    #
    # En el orden en que corren, también las que están en pausa (enabled: false).
    #
    # GET /v1/rules
    # https://fiscalisto.com/docs/api/referencia/reglas/list-rules
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :trigger Solo las de este trigger, por ejemplo invoice.received.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/rules", params, opts, kw)
    end

    # Ordenar las reglas
    #
    # rules de la primera a la última; las que no mande siguen después, en su orden. Importa cuando una tiene stop_after o dos ponen cosas distintas: corren de arriba abajo.
    #
    # POST /v1/rules/order
    # https://fiscalisto.com/docs/api/referencia/reglas/order-rules
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Array] :rules (obligatorio) Las reglas (rul_…), de la primera a la última.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def order(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/rules/order", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver una regla
    #
    # Una regla de la empresa del emisor.
    #
    # GET /v1/rules/{id}
    # https://fiscalisto.com/docs/api/referencia/reglas/get-rule
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/rules/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar una regla
    #
    # Solo lo que mande cambia; conditions y actions se reemplazan completos. enabled: false la pone en pausa. Lo que ya hizo se queda.
    #
    # POST /v1/rules/{id}
    # https://fiscalisto.com/docs/api/referencia/reglas/update-rule
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Cómo se llama en Ajustes › Reglas.
    # @option params [String] :trigger Cuándo corre: invoice.received (llega una factura de un proveedor), invoice.issued (se emite una factura), in…
    # @option params [Hash] :conditions Si: lo que tiene que cumplir.
    # @option params [Array] :actions Entonces: de 1 a 8, en este orden.
    # @option params [Array] :else_actions Si no: de 0 a 8 acciones, las mismas de actions, que hace cuando sus condiciones no se cumplen.
    # @option params [Boolean] :once_per_record true: corre una sola vez por factura, orden o movimiento.
    # @option params [Integer] :wait_days Esperar y volver a revisar: si se cumple, espera estos días (1 a 90) y revisa de nuevo el registro como esté…
    # @option params [Array] :follow_ups Si sigue así: hasta 5 pasos días después de que actuó (recordatorios, escalar).
    # @option params [Boolean] :stop_after true: si se cumple, las reglas que siguen no corren para ese registro.
    # @option params [Boolean] :enabled false la deja en pausa.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/rules/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una regla
    #
    # Deja de correr. Lo que ya puso (centros de costo, etiquetas, etapas) se queda; para dejarla de usar un tiempo, mejor enabled: false.
    #
    # DELETE /v1/rules/{id}
    # https://fiscalisto.com/docs/api/referencia/reglas/delete-rule
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/rules/#{Core.path(id)}", nil, opts, kw)
    end

    # Probar una regla
    #
    # Lo que haría con una factura (uuid) o con las más recientes de su trigger, sin cambiar nada: cada condición con lo que tiene el registro y si se cumple.
    #
    # POST /v1/rules/{id}/test
    # https://fiscalisto.com/docs/api/referencia/reglas/test-rule
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :uuid El folio fiscal (UUID) de una factura; sin él, las más recientes.
    # @option params [Integer] :limit Cuántas de las más recientes (10 por omisión).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def test(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/rules/#{Core.path(id)}/test", params, opts, kw, send: :body, idempotent: true)
    end

    # Historial de una regla
    #
    # Cada vez que corrió, la más reciente primero: sobre qué factura u orden, qué hizo (did) o por qué no pudo (error). Se guardan 180 días.
    #
    # GET /v1/rules/{id}/runs
    # https://fiscalisto.com/docs/api/referencia/reglas/list-rule-runs
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list_runs(id, params = nil, opts = nil, **kw)
      @client.list_call("/v1/rules/#{Core.path(id)}/runs", params, opts, kw)
    end

    # Probar una regla en los últimos días
    #
    # Con todos los registros de su trigger de los últimos days días (90 por omisión, hasta 2,000): en cuántos se cumple, cuánto suman y qué habría hecho. No cambia nada.
    #
    # POST /v1/rules/{id}/backtest
    # https://fiscalisto.com/docs/api/referencia/reglas/backtest-rule
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Integer] :days Cuántos días hacia atrás (90 por omisión, hasta 90).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def backtest(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/rules/#{Core.path(id)}/backtest", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambios de una regla
    #
    # Cada cambio, el más reciente primero, con quién lo hizo y la regla como quedó. También de una regla borrada (90 días).
    #
    # GET /v1/rules/{id}/versions
    # https://fiscalisto.com/docs/api/referencia/reglas/list-rule-versions
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list_versions(id, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/rules/#{Core.path(id)}/versions", params, opts, kw, send: :query)
    end

    # Regresar una regla a una versión
    #
    # La regla vuelve a como quedó en esa versión; una borrada vuelve a existir. Se revisa como cualquier cambio y queda como una versión más.
    #
    # POST /v1/rules/{id}/versions/{version}/restore
    # https://fiscalisto.com/docs/api/referencia/reglas/restore-rule-version
    #
    # @param id [String]
    # @param version [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def restore_version(id, version, opts = nil, **kw)
      @client.call("POST", "/v1/rules/#{Core.path(id)}/versions/#{Core.path(version)}/restore", nil, opts, kw, idempotent: true)
    end
  end

  # Reglas: fiscalisto.supplier_groups.
  class SupplierGroupsResource
    def initialize(client)
      @client = client
    end

    # Crear un grupo de proveedores
    #
    # Un grupo de proveedores (fletes, materia prima…), como Proveedores › Grupos en la app. Cada proveedor está en un solo grupo: los de suppliers salen del que tenían. Una regla vale para todo el grupo con la condición supplierGroup.
    #
    # POST /v1/supplier_groups
    # https://fiscalisto.com/docs/api/referencia/reglas/create-supplier-group
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :name (obligatorio) Nombre.
    # @option params [String] :color Color de su etiqueta en la app: info, warning, positive, critical o muted.
    # @option params [Array] :suppliers RFC de los proveedores que entran al grupo (hasta 500); salen del que tenían.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/supplier_groups", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar grupos de proveedores
    #
    # Los grupos de proveedores, con cuántos proveedores tiene cada uno.
    #
    # GET /v1/supplier_groups
    # https://fiscalisto.com/docs/api/referencia/reglas/list-supplier-groups
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/supplier_groups", params, opts, kw)
    end

    # Ver un grupo de proveedores
    #
    # Un grupo de proveedores.
    #
    # GET /v1/supplier_groups/{id}
    # https://fiscalisto.com/docs/api/referencia/reglas/get-supplier-group
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/supplier_groups/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un grupo de proveedores
    #
    # Cambia solo lo que manda: su nombre, su color, los proveedores que entran (add_suppliers) y los que salen (remove_suppliers).
    #
    # POST /v1/supplier_groups/{id}
    # https://fiscalisto.com/docs/api/referencia/reglas/update-supplier-group
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Nombre.
    # @option params [String] :color Color de su etiqueta en la app: info, warning, positive, critical o muted.
    # @option params [Array] :add_suppliers RFC de los proveedores que entran al grupo (hasta 500); salen del que tenían.
    # @option params [Array] :remove_suppliers RFC de los proveedores que salen del grupo y quedan sin grupo (hasta 500).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/supplier_groups/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar un grupo de proveedores
    #
    # Sus proveedores se quedan sin grupo, y las reglas que lo usan ya no aplican a nadie.
    #
    # DELETE /v1/supplier_groups/{id}
    # https://fiscalisto.com/docs/api/referencia/reglas/delete-supplier-group
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/supplier_groups/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Hallazgos: fiscalisto.findings.
  class FindingsResource
    def initialize(client)
      @client = client
    end

    # Listar hallazgos
    #
    # Lo que Fiscalisto encontró en las órdenes de compra, pagos, proveedores, contabilidad, viáticos, tickets de compra, inventario, clientes y nómina del emisor, el más reciente primero: una factura que no coincide con su orden, un proveedor en la lista 69-B, un documento vencido, Caja con saldo acreedor, una comprobación vencida, un ticket sin factura, una existencia negativa, un saldo vencido, un salario diario integrado bajo. Sin status, los que nadie ha revisado. Los de facturas están en GET /v1/sat_findings. No usa timbres.
    #
    # GET /v1/findings
    # https://fiscalisto.com/docs/api/referencia/hallazgos/list-findings
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :area Solo los de un área: purchase_orders, payouts, suppliers, accounting, bank, expense_reports, purchase_receipt…
    # @option params [String] :status open (por omisión: sin revisar), reviewed (revisados), resolved (ya no aplican) o all.
    # @option params [String] :severity Solo los de esta gravedad: critical, warning o info.
    # @option params [String] :code Solo este tipo de hallazgo (oc_factura_distinta…).
    # @option params [String] :counterparty_tax_id Solo los de este proveedor (su RFC).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/findings", params, opts, kw)
    end

    # Ver un hallazgo
    #
    # Un hallazgo, con su registro y si lo revisaron.
    #
    # GET /v1/findings/{id}
    # https://fiscalisto.com/docs/api/referencia/hallazgos/get-finding
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/findings/#{Core.path(id)}", nil, opts, kw)
    end

    # Marcar un hallazgo como revisado
    #
    # Como «Revisado» en la app: alguien vio el hallazgo y está bien, con una nota opcional de por qué. Si detenía su registro, ya no lo detiene. Uno ya revisado cambia su nota. Uno que ya no aplica contesta finding_resolved. Si lo que lo causó cambia después, vuelve a abrirse solo.
    #
    # POST /v1/findings/{id}/review
    # https://fiscalisto.com/docs/api/referencia/hallazgos/review-finding
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :note Por qué está bien (hasta 500 caracteres).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def review(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/findings/#{Core.path(id)}/review", params, opts, kw, send: :body, idempotent: true)
    end

    # Volver a abrir un hallazgo
    #
    # Como «Deshacer» en la app: un hallazgo revisado vuelve a «Sin revisar», sin su nota, y si su ajuste es detener el registro, lo vuelve a detener.
    #
    # POST /v1/findings/{id}/reopen
    # https://fiscalisto.com/docs/api/referencia/hallazgos/reopen-finding
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reopen(id, opts = nil, **kw)
      @client.call("POST", "/v1/findings/#{Core.path(id)}/reopen", nil, opts, kw, idempotent: true)
    end
  end

  # Centros de costo: fiscalisto.cost_centers.
  class CostCentersResource
    def initialize(client)
      @client = client
    end

    # Crear un centro de costo
    #
    # Una parte del negocio del emisor que quiere ver por separado: una obra, un proyecto, una sucursal, un área. Sus facturas lo toman con cost_center al crearlas, o después con POST /v1/invoices/{id} y POST /v1/sat_invoices/{id}. Un nombre que ya existe contesta cost_center_exists. Hasta 500 por emisor.
    #
    # POST /v1/cost_centers
    # https://fiscalisto.com/docs/api/referencia/centros-de-costo/create-cost-center
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Cómo lo llama su equipo, por ejemplo «Obra Norte».
    # @option params [String] :code Su clave, si su contabilidad usa claves (por ejemplo «CC-01»).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cost_centers", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar centros de costo
    #
    # Los centros de costo del emisor, los más recientes primero, con cuántas facturas tiene cada uno. Los archivados solo con include_archived=true.
    #
    # GET /v1/cost_centers
    # https://fiscalisto.com/docs/api/referencia/centros-de-costo/list-cost-centers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Boolean] :include_archived true para incluir los archivados.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/cost_centers", params, opts, kw)
    end

    # Ver un centro de costo
    #
    # Un centro de costo del emisor.
    #
    # GET /v1/cost_centers/{id}
    # https://fiscalisto.com/docs/api/referencia/centros-de-costo/get-cost-center
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/cost_centers/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un centro de costo
    #
    # Cambia solo lo que manda. archived: true lo archiva (ya no se ponen facturas en él y las suyas lo conservan), false lo restaura.
    #
    # POST /v1/cost_centers/{id}
    # https://fiscalisto.com/docs/api/referencia/centros-de-costo/update-cost-center
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Cómo lo llama su equipo, por ejemplo «Obra Norte».
    # @option params [String] :code Su clave, si su contabilidad usa claves (por ejemplo «CC-01»).
    # @option params [Boolean] :archived true lo archiva: ya no se pueden poner facturas en él, pero las suyas lo conservan.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cost_centers/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un centro de costo
    #
    # Sus facturas pasan a move_to (así junta dos en uno) o se quedan sin centro de costo. No se puede deshacer; para dejar de usarlo sin tocar sus facturas, archívelo.
    #
    # DELETE /v1/cost_centers/{id}
    # https://fiscalisto.com/docs/api/referencia/centros-de-costo/delete-cost-center
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :move_to Otro centro de costo (ccn_…) que se queda con sus facturas.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/cost_centers/#{Core.path(id)}", params, opts, kw, send: :query)
    end
  end

  # Etiquetas: fiscalisto.tags.
  class TagsResource
    def initialize(client)
      @client = client
    end

    # Crear una etiqueta
    #
    # Una palabra suya para juntar facturas y órdenes de compra: una obra, un evento, un cliente, «Urgente». Es la misma lista de Etiquetas en la app. Un nombre que ya existe (sin importar mayúsculas ni acentos) contesta tag_exists con su id. Hasta 200 por empresa.
    #
    # POST /v1/tags
    # https://fiscalisto.com/docs/api/referencia/etiquetas/create-tag
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Cómo la llama su equipo, por ejemplo «Obra Norte».
    # @option params [String] :color Su color: info (azul), positive (verde), warning (ámbar), critical (rojo) o muted (gris).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/tags", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar etiquetas
    #
    # Las etiquetas del emisor, las más recientes primero, con cuántas órdenes de compra y facturas lleva cada una.
    #
    # GET /v1/tags
    # https://fiscalisto.com/docs/api/referencia/etiquetas/list-tags
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/tags", params, opts, kw)
    end

    # Ver una etiqueta
    #
    # Una etiqueta del emisor.
    #
    # GET /v1/tags/{id}
    # https://fiscalisto.com/docs/api/referencia/etiquetas/get-tag
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/tags/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una etiqueta
    #
    # Cambia su nombre o su color; se ve así en todas sus facturas y órdenes. Un nombre que ya tiene otra contesta tag_exists.
    #
    # POST /v1/tags/{id}
    # https://fiscalisto.com/docs/api/referencia/etiquetas/update-tag
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Cómo la llama su equipo, por ejemplo «Obra Norte».
    # @option params [String] :color Su color: info (azul), positive (verde), warning (ámbar), critical (rojo) o muted (gris).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/tags/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una etiqueta
    #
    # Se quita de sus facturas y órdenes de compra, que no cambian en nada más, y se borran sus etiquetas automáticas. No se puede deshacer.
    #
    # DELETE /v1/tags/{id}
    # https://fiscalisto.com/docs/api/referencia/etiquetas/delete-tag
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/tags/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Listas de precios: fiscalisto.price_lists.
  class PriceListsResource
    def initialize(client)
      @client = client
    end

    # Crear una lista de precios
    #
    # Parte del precio del catálogo (o de base_list, otra lista), lo mueve adjust_percent y lo redondea a round_to; con starts_on y ends_on es una promoción. items le pone precios propios por producto, por presentación (unit, una caja) y desde min_quantity (escalones de mayoreo), cada uno con unit_price o discount_percent. is_default: la tienen los clientes sin otra. Hasta 100.
    #
    # POST /v1/price_lists
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/create-price-list
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :name (obligatorio) Mayoreo, Distribuidor, Buen Fin…
    # @option params [String] :description Descripción.
    # @option params [String] :base_list Otra lista (prl_…) de la que parte; null o sin ella: el precio del catálogo.
    # @option params [Numeric] :adjust_percent Cuánto mueve el precio del que parte: −10 lo baja 10 %, 5 lo sube 5 %.
    # @option params [Numeric] :round_to Redondea a: 0.5, 1, 5, 10… (null: a centavos).
    # @option params [String] :starts_on Desde qué día vale (YYYY-MM-DD, Ciudad de México), o null desde siempre.
    # @option params [String] :ends_on Hasta qué día vale, ese día incluido (YYYY-MM-DD), o null sin fin.
    # @option params [Boolean] :is_default La tienen los clientes sin otra lista (ni ellos ni su grupo).
    # @option params [Array] :items Sus precios propios; al mandarlos reemplazan a los que tenía.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/price_lists", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar listas de precios
    #
    # Las listas de precios en el orden de la app, con cuántos grupos y clientes la tienen. items viene al ver una.
    #
    # GET /v1/price_lists
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/list-price-lists
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/price_lists", params, opts, kw)
    end

    # Ver una lista de precios
    #
    # Una lista de precios con sus precios propios (items).
    #
    # GET /v1/price_lists/{id}
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/get-price-list
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/price_lists/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una lista de precios
    #
    # Cambia solo lo que manda; items reemplaza todos sus precios propios. Las facturas, cotizaciones y pedidos ya hechos no cambian.
    #
    # POST /v1/price_lists/{id}
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/update-price-list
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Mayoreo, Distribuidor, Buen Fin…
    # @option params [String] :description Descripción.
    # @option params [String] :base_list Otra lista (prl_…) de la que parte; null o sin ella: el precio del catálogo.
    # @option params [Numeric] :adjust_percent Cuánto mueve el precio del que parte: −10 lo baja 10 %, 5 lo sube 5 %.
    # @option params [Numeric] :round_to Redondea a: 0.5, 1, 5, 10… (null: a centavos).
    # @option params [String] :starts_on Desde qué día vale (YYYY-MM-DD, Ciudad de México), o null desde siempre.
    # @option params [String] :ends_on Hasta qué día vale, ese día incluido (YYYY-MM-DD), o null sin fin.
    # @option params [Boolean] :is_default La tienen los clientes sin otra lista (ni ellos ni su grupo).
    # @option params [Array] :items Sus precios propios; al mandarlos reemplazan a los que tenía.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/price_lists/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar una lista de precios
    #
    # La archiva: sus grupos y clientes pasan a la lista que aplica a todos (o al precio del catálogo).
    #
    # DELETE /v1/price_lists/{id}
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/delete-price-list
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/price_lists/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Listas de precios: fiscalisto.customer_groups.
  class CustomerGroupsResource
    def initialize(client)
      @client = client
    end

    # Crear un grupo de clientes
    #
    # Lo que tienen todos sus clientes: price_list, discount_percent (el descuento de cada concepto en el CFDI), credit_days, min_order (antes de IVA, desde el portal) y portal_ordering. Un cliente entra con group en POST /v1/customers/{id}.
    #
    # POST /v1/customer_groups
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/create-customer-group
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :name (obligatorio) Nombre.
    # @option params [String] :color Color de su etiqueta en la app: info, warning, positive, critical o muted.
    # @option params [String] :price_list Su lista (prl_…); null: la que aplica a todos.
    # @option params [Numeric] :discount_percent Un descuento en cada concepto, como descuento del CFDI.
    # @option params [Integer] :credit_days Días de crédito que se le dan, de 0 a 365, o null para no cambiar los del cliente.
    # @option params [Integer] :quote_valid_days Días que vale una cotización nueva para sus clientes; null: los de la empresa (Ajustes › Horarios).
    # @option params [Numeric] :min_order El pedido mínimo antes de IVA desde el Portal del cliente.
    # @option params [Boolean] :portal_ordering Sus clientes pueden hacer pedidos desde su Portal del cliente (true por omisión).
    # @option params [String] :portal_changes Hasta cuándo sus clientes cambian o cancelan desde su portal un pedido que mandaron ahí: none, until_confirme…
    # @option params [Array] :delivery_days Días de la semana en que les entrega (0 domingo a 6 sábado); null: cualquier día.
    # @option params [Integer] :cutoff_hour Hora de corte (0 a 23, Ciudad de México): un pedido del portal después de ella cuenta desde el día siguiente;…
    # @option params [Integer] :prep_days Días para preparar un pedido antes de poder entregarlo (0 por omisión).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/customer_groups", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar grupos de clientes
    #
    # Los grupos de clientes, con cuántos clientes tiene cada uno.
    #
    # GET /v1/customer_groups
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/list-customer-groups
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/customer_groups", params, opts, kw)
    end

    # Ver un grupo de clientes
    #
    # Un grupo de clientes.
    #
    # GET /v1/customer_groups/{id}
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/get-customer-group
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/customer_groups/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un grupo de clientes
    #
    # Cambia solo lo que manda.
    #
    # POST /v1/customer_groups/{id}
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/update-customer-group
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Nombre.
    # @option params [String] :color Color de su etiqueta en la app: info, warning, positive, critical o muted.
    # @option params [String] :price_list Su lista (prl_…); null: la que aplica a todos.
    # @option params [Numeric] :discount_percent Un descuento en cada concepto, como descuento del CFDI.
    # @option params [Integer] :credit_days Días de crédito que se le dan, de 0 a 365, o null para no cambiar los del cliente.
    # @option params [Integer] :quote_valid_days Días que vale una cotización nueva para sus clientes; null: los de la empresa (Ajustes › Horarios).
    # @option params [Numeric] :min_order El pedido mínimo antes de IVA desde el Portal del cliente.
    # @option params [Boolean] :portal_ordering Sus clientes pueden hacer pedidos desde su Portal del cliente (true por omisión).
    # @option params [String] :portal_changes Hasta cuándo sus clientes cambian o cancelan desde su portal un pedido que mandaron ahí: none, until_confirme…
    # @option params [Array] :delivery_days Días de la semana en que les entrega (0 domingo a 6 sábado); null: cualquier día.
    # @option params [Integer] :cutoff_hour Hora de corte (0 a 23, Ciudad de México): un pedido del portal después de ella cuenta desde el día siguiente;…
    # @option params [Integer] :prep_days Días para preparar un pedido antes de poder entregarlo (0 por omisión).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/customer_groups/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar un grupo de clientes
    #
    # Sus clientes se quedan sin grupo.
    #
    # DELETE /v1/customer_groups/{id}
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/delete-customer-group
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/customer_groups/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Listas de precios: fiscalisto.prices.
  class PricesResource
    def initialize(client)
      @client = client
    end

    # Ver los precios de un cliente
    #
    # Lo que un cliente paga por unos productos a una cantidad: el precio por unidad sin IVA de su lista (la suya, la de su grupo o la de todos), su descuento y el siguiente escalón de mayoreo. No guarda nada.
    #
    # POST /v1/prices
    # https://fiscalisto.com/docs/api/referencia/listas-de-precios/quote-prices
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :customer (obligatorio) El cliente (cus_…) o su RFC.
    # @option params [Array] :items (obligatorio) Conceptos (Conceptos), al menos uno.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def quote(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/prices", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Asistencia: fiscalisto.attendance.
  class AttendanceResource
    def initialize(client)
      @client = client
    end

    # Ver la asistencia de un periodo
    #
    # El registro de jornada del emisor (LFT art. 132) del periodo, por empleado: minutos trabajados contra su horario, faltas, retardos, días sin salida, marcas con notas y horas extra dobles y triples por semana. Con employee, también cada día y cada marca (con sus correcciones). Hasta 92 días a la vez.
    #
    # GET /v1/attendance
    # https://fiscalisto.com/docs/api/referencia/asistencia/get-attendance
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :from (obligatorio) Primer día, AAAA-MM-DD.
    # @option params [String] :to (obligatorio) Último día, AAAA-MM-DD (hasta 92 días después de from).
    # @option params [String] :employee Solo este empleado (emp_…), con sus días y marcas.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/attendance", params, opts, kw, send: :query)
    end

    # Registrar una marca
    #
    # Una entrada o salida que viene de otro reloj checador. Queda con method api y su motivo, y el empleado la ve en su enlace. Una marca igual del mismo empleado dentro de 60 segundos no se duplica.
    #
    # POST /v1/attendance/marks
    # https://fiscalisto.com/docs/api/referencia/asistencia/create-attendance-mark
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [String] :kind (obligatorio) in: entrada; out: salida.
    # @option params [String] :at (obligatorio) Cuándo marcó, con su zona horaria (2027-01-04T09:02:00-06:00).
    # @option params [String] :reason Por qué se registra (se guarda y el empleado lo ve en su enlace).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_mark(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/marks", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar una marca
    #
    # La marca deja de contar y queda tachada con su motivo, quién y cuándo (nunca se borra). En la app se puede restaurar.
    #
    # POST /v1/attendance/marks/{id}/void
    # https://fiscalisto.com/docs/api/referencia/asistencia/void-attendance-mark
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :reason (obligatorio) Por qué se quita: queda tachada con este motivo y el empleado lo ve.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def void_mark(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/marks/#{Core.path(id)}/void", params, opts, kw, send: :body, idempotent: true)
    end

    # Autorizar o rechazar horas extra
    #
    # Hasta cuántos minutos de horas extra de un día de un empleado cuentan para la nómina, antes o después de ese día, o rechazarlas todas (rejected: true, con comment). minutes null quita la decisión. Con la regla de horas extra «Necesitan autorización», lo que nadie autorizó queda en el registro como sin autorizar.
    #
    # POST /v1/attendance/overtime
    # https://fiscalisto.com/docs/api/referencia/asistencia/approve-attendance-overtime
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :employee (obligatorio) El empleado (emp_…).
    # @option params [String] :date (obligatorio) AAAA-MM-DD.
    # @option params [Integer] :minutes (obligatorio) Hasta cuántos minutos de horas extra de ese día cuentan para la nómina (0 a 960); null quita la decisión.
    # @option params [Boolean] :rejected true rechaza todas las horas extra de ese día: quedan en el registro, no cuentan para la nómina y dejan de es…
    # @option params [String] :comment Por qué (obligatorio al rechazar; el empleado lo ve).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def approve_overtime(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/overtime", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar los turnos
    #
    # Los turnos de Asistencia › Turnos (ats_…), los archivados también: sus tramos, sus minutos y su jornada por ley (diurna, nocturna o mixta, LFT art. 60) con lo que dice la ley de ellos.
    #
    # GET /v1/attendance/shifts
    # https://fiscalisto.com/docs/api/referencia/asistencia/list-attendance-shifts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list_shifts(params = nil, opts = nil, **kw)
      @client.list_call("/v1/attendance/shifts", params, opts, kw)
    end

    # Crear un turno
    #
    # Un turno con uno a tres tramos (con dos o tres es partido: el tiempo entre tramos no es jornada); un tramo puede pasar de la medianoche. Se guarda aunque pase de la jornada del art. 61 (con el acuerdo del trabajador, art. 58) y lo dice en warnings.
    #
    # POST /v1/attendance/shifts
    # https://fiscalisto.com/docs/api/referencia/asistencia/create-attendance-shift
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Su nombre, como «Nocturno».
    # @option params [Array] :segments (obligatorio) Sus tramos: uno, o dos o tres para un turno partido (el tiempo entre tramos no es jornada).
    # @option params [Integer] :break_minutes Minutos de descanso dentro de un turno de un tramo.
    # @option params [Boolean] :break_paid El descanso cuenta como jornada: el trabajador no puede salir del lugar (LFT art.
    # @option params [String] :color Su color en el calendario.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_shift(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/shifts", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar un turno
    #
    # Cambia lo que mande y deja lo demás. Cambiar sus horas cambia los días que lo tienen desde hoy; archived: true lo archiva.
    #
    # POST /v1/attendance/shifts/{id}
    # https://fiscalisto.com/docs/api/referencia/asistencia/update-attendance-shift
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Su nombre, como «Nocturno».
    # @option params [Array] :segments Sus tramos: uno, o dos o tres para un turno partido (el tiempo entre tramos no es jornada).
    # @option params [Integer] :break_minutes Minutos de descanso dentro de un turno de un tramo.
    # @option params [Boolean] :break_paid El descanso cuenta como jornada: el trabajador no puede salir del lugar (LFT art.
    # @option params [String] :color Su color en el calendario.
    # @option params [Boolean] :archived true lo archiva: ya no se puede poner en días ni roles nuevos; los días que ya lo tienen lo conservan.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_shift(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/shifts/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar los roles de turnos
    #
    # Los roles de turnos (atr_…), los archivados también: el ciclo de turnos y descansos, el promedio a la semana y el aviso del art. 69 si pasan más de seis días de trabajo sin descanso.
    #
    # GET /v1/attendance/rotations
    # https://fiscalisto.com/docs/api/referencia/asistencia/list-attendance-rotations
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list_rotations(params = nil, opts = nil, **kw)
      @client.list_call("/v1/attendance/rotations", params, opts, kw)
    end

    # Crear un rol de turnos
    #
    # Un ciclo de turnos y descansos en orden que vuelve a empezar al terminar (4×4: cuatro días un turno y cuatro null). A cada empleado se le pone en la app, en Asistencia › Personas, con el día en que cae su día 1.
    #
    # POST /v1/attendance/rotations
    # https://fiscalisto.com/docs/api/referencia/asistencia/create-attendance-rotation
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Su nombre, como «4×4».
    # @option params [Array] :days (obligatorio) El ciclo en orden, de 1 a 56 días: cada uno un turno (ats_…) o null para descanso.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_rotation(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/rotations", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar un rol de turnos
    #
    # Cambia su nombre o su ciclo; archived: true lo archiva.
    #
    # POST /v1/attendance/rotations/{id}
    # https://fiscalisto.com/docs/api/referencia/asistencia/update-attendance-rotation
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Su nombre, como «4×4».
    # @option params [Array] :days El ciclo en orden, de 1 a 56 días: cada uno un turno (ats_…) o null para descanso.
    # @option params [Boolean] :archived true lo archiva: quien lo tiene lo sigue usando; ya no se le puede poner a nadie más.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_rotation(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/rotations/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver el calendario de turnos
    #
    # El turno de cada empleado cada día de un mes y de dónde sale: un cambio puesto en el calendario, su rol de turnos o su horario de la semana.
    #
    # GET /v1/attendance/calendar
    # https://fiscalisto.com/docs/api/referencia/asistencia/get-attendance-calendar
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :month (obligatorio) El mes, AAAA-MM.
    # @option params [String] :employee Solo este empleado (emp_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get_calendar(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/attendance/calendar", params, opts, kw, send: :query)
    end

    # Poner turnos en el calendario
    #
    # Pone un turno (o descanso, shift null) en unos días de unos empleados, y gana sobre su rol y su horario: un cambio de turno, un descanso extra. clear: true lo quita y esos días vuelven a su rol u horario. Hasta 62 días y 500 empleados a la vez.
    #
    # POST /v1/attendance/calendar
    # https://fiscalisto.com/docs/api/referencia/asistencia/set-attendance-calendar
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :employees (obligatorio) Los empleados (emp_…), todos del mismo emisor.
    # @option params [Array] :dates (obligatorio) Los días, AAAA-MM-DD (hasta 62).
    # @option params [String] :shift (obligatorio) El turno (ats_…) que tienen esos días, o null para descanso.
    # @option params [Boolean] :clear true quita lo que se puso en el calendario: esos días vuelven a su rol de turnos o a su horario de la semana…
    # @option params [String] :comment Por qué (un cambio de turno, un descanso extra).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set_calendar(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/attendance/calendar", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Viáticos y gastos: fiscalisto.expense_people.
  class ExpensePeopleResource
    def initialize(client)
      @client = client
    end

    # Agregar a una persona
    #
    # Alguien que viaja o gasta por el emisor: un empleado (employee, emp_…: sus anticipos y reembolsos «En la nómina» van en su siguiente recibo) o alguien por honorarios (name y tax_id). Con email, Fiscalisto le puede mandar su enlace.
    #
    # POST /v1/expense_people
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/create-expense-person
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :kind (obligatorio) empleado (sus viáticos van en su recibo de nómina; sus facturas pueden ir a su nombre en un viaje) o honorari…
    # @option params [String] :employee Un empleado de Nómina (emp_…): su nombre, RFC y correo se toman de ahí y sus viáticos van en su recibo.
    # @option params [String] :name Su nombre.
    # @option params [String] :tax_id Su RFC.
    # @option params [String] :email Su correo: para mandarle su enlace y avisarle cuando se aprueba o se le paga.
    # @option params [String] :base_city Dónde trabaja (por ejemplo «Guadalajara, Jal.»): un viaje a menos de 50 km no es deducible como viáticos.
    # @option params [String] :department Su área.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_people", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar personas
    #
    # Las personas que comprueban gastos del emisor, las más recientes primero. Las archivadas solo con include_archived=true.
    #
    # GET /v1/expense_people
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/list-expense-people
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Boolean] :include_archived true para incluir las archivadas.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/expense_people", params, opts, kw)
    end

    # Ver una persona
    #
    # Una persona que comprueba gastos del emisor.
    #
    # GET /v1/expense_people/{id}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/get-expense-person
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/expense_people/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una persona
    #
    # Cambia solo lo que manda. archived: true la archiva (ya no se le abren comprobaciones y su enlace deja de funcionar), false la restaura.
    #
    # POST /v1/expense_people/{id}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/update-expense-person
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :kind empleado (sus viáticos van en su recibo de nómina; sus facturas pueden ir a su nombre en un viaje) o honorari…
    # @option params [String] :employee Un empleado de Nómina (emp_…): su nombre, RFC y correo se toman de ahí y sus viáticos van en su recibo.
    # @option params [String] :name Su nombre.
    # @option params [String] :tax_id Su RFC.
    # @option params [String] :email Su correo: para mandarle su enlace y avisarle cuando se aprueba o se le paga.
    # @option params [String] :base_city Dónde trabaja (por ejemplo «Guadalajara, Jal.»): un viaje a menos de 50 km no es deducible como viáticos.
    # @option params [String] :department Su área.
    # @option params [Boolean] :archived true la archiva (y apaga su enlace): ya no se le abren comprobaciones.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_people/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Dar su enlace a una persona
    #
    # El enlace donde la persona ve solo sus comprobaciones y sube sus facturas desde el teléfono, sin cuenta. Con renew: true le da uno nuevo y el anterior deja de funcionar.
    #
    # POST /v1/expense_people/{id}/link
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/create-expense-person-link
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Boolean] :renew true le da un enlace nuevo: el anterior deja de funcionar en ese momento (por ejemplo, si se compartió por er…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_link(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_people/#{Core.path(id)}/link", params, opts, kw, send: :body, idempotent: true)
    end

    # Apagar el enlace de una persona
    #
    # Su enlace deja de funcionar (url: null). Puede darle uno nuevo después con POST /v1/expense_people/{id}/link.
    #
    # DELETE /v1/expense_people/{id}/link
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/delete-expense-person-link
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_link(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/expense_people/#{Core.path(id)}/link", nil, opts, kw)
    end
  end

  # Viáticos y gastos: fiscalisto.expense_reports.
  class ExpenseReportsResource
    def initialize(client)
      @client = client
    end

    # Abrir una comprobación
    #
    # Una por viaje (kind viaje) o una por periodo de gastos de oficina que la empresa reembolsa (kind gastos). Queda abierta (draft): se le agregan gastos y anticipos, y se envía con POST /v1/expense_reports/{id}/submit.
    #
    # POST /v1/expense_reports
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/create-expense-report
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :person (obligatorio) La persona (exp_…).
    # @option params [String] :kind viaje (por omisión) o gastos (gastos de oficina de un periodo que la empresa reembolsa).
    # @option params [String] :title Su nombre.
    # @option params [String] :purpose Para qué fue: el SAT pide que el viaje sea por el negocio.
    # @option params [String] :destination A dónde.
    # @option params [Boolean] :abroad Al extranjero: cambian los topes de alimentos y hospedaje.
    # @option params [Boolean] :far A más de 50 km de donde trabaja la persona (por omisión, true).
    # @option params [String] :start_date La salida (o el inicio del periodo).
    # @option params [String] :end_date El regreso (o el fin del periodo).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar comprobaciones
    #
    # Las comprobaciones del emisor, las más recientes primero, con sus gastos y movimientos.
    #
    # GET /v1/expense_reports
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/list-expense-reports
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo las de un estado: draft, submitted, rejected, approved o closed.
    # @option params [String] :person Solo las de una persona (exp_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/expense_reports", params, opts, kw)
    end

    # Ver una comprobación
    #
    # Una comprobación con sus gastos, lo deducible de cada uno, sus avisos (issues) contra la ley y la política, y su saldo.
    #
    # GET /v1/expense_reports/{id}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/get-expense-report
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/expense_reports/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una comprobación
    #
    # Cambia solo lo que manda: su nombre, el propósito, el destino y las fechas. Mientras no esté aprobada.
    #
    # POST /v1/expense_reports/{id}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/update-expense-report
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :title Su nombre.
    # @option params [String] :purpose Para qué fue: el SAT pide que el viaje sea por el negocio.
    # @option params [String] :destination A dónde.
    # @option params [Boolean] :abroad Al extranjero: cambian los topes de alimentos y hospedaje.
    # @option params [Boolean] :far A más de 50 km de donde trabaja la persona (por omisión, true).
    # @option params [String] :start_date La salida (o el inicio del periodo).
    # @option params [String] :end_date El regreso (o el fin del periodo).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una comprobación
    #
    # Una que no esté aprobada y no tenga anticipos ni pagos (quítelos antes). No se puede deshacer.
    #
    # DELETE /v1/expense_reports/{id}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/delete-expense-report
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/expense_reports/#{Core.path(id)}", nil, opts, kw)
    end

    # Enviar a aprobar
    #
    # La persona termina: pasa a submitted (por aprobar). Contesta expense_report_invalid si un gasto tiene un error (issues con level error).
    #
    # POST /v1/expense_reports/{id}/submit
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/submit-expense-report
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def submit(id, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/submit", nil, opts, kw, idempotent: true)
    end

    # Aprobar una comprobación
    #
    # Pasa a approved (por liquidar): sus facturas se deducen en los impuestos del emisor y entra en las pólizas contra 107.01 Funcionarios y empleados. Con el saldo en cero se cierra sola; si no, liquide con un reembolso o una devolución.
    #
    # POST /v1/expense_reports/{id}/approve
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/approve-expense-report
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :note Una nota para la persona.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def approve(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/approve", params, opts, kw, send: :body, idempotent: true)
    end

    # Devolver para corregir
    #
    # Regresa a la persona (rejected, «Devuelta») con una nota de qué corregir. La corrige y la vuelve a enviar.
    #
    # POST /v1/expense_reports/{id}/return
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/return-expense-report
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :note (obligatorio) Qué debe corregir: se le manda a la persona.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def send_back(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/return", params, opts, kw, send: :body, idempotent: true)
    end

    # Reabrir una comprobación
    #
    # Una aprobada vuelve a abierta: sus facturas dejan de deducirse y sale de las pólizas. No si ya se reportó en la nómina.
    #
    # POST /v1/expense_reports/{id}/reopen
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/reopen-expense-report
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reopen(id, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/reopen", nil, opts, kw, idempotent: true)
    end

    # Agregar un gasto
    #
    # Con uuid, una factura recibida del emisor (GET /v1/sat_invoices): la fecha, el monto y el proveedor salen de ella. Sin uuid, un gasto con su category, date y amount (un ticket, un comprobante del extranjero). Contesta la comprobación revisada.
    #
    # POST /v1/expense_reports/{id}/items
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/create-expense-item
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :uuid El UUID de una factura recibida del emisor (GET /v1/sat_invoices): la fecha, el monto, el proveedor y la form…
    # @option params [String] :category (obligatorio) De qué es: hospedaje, alimentos, avion, transporte, auto, combustible (gasolina, casetas y estacionamiento),…
    # @option params [String] :date Cuándo se gastó.
    # @option params [String] :description Qué fue (el proveedor).
    # @option params [Numeric] :amount En pesos.
    # @option params [Numeric] :foreign_amount En su moneda, si fue en otra.
    # @option params [String] :foreign_currency La moneda (USD, EUR…).
    # @option params [Integer] :people En alimentos, cuántas personas comieron: el tope es por persona.
    # @option params [String] :payment Cómo se pagó: tarjeta_empresa (no se le reembolsa), tarjeta_propia, efectivo, transferencia u otro.
    # @option params [String] :receipt Su comprobante: cfdi, extranjero, ticket o ninguno.
    # @option params [String] :note Por qué, si pasa la política (la política puede pedirla).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_item(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/items", params, opts, kw, send: :body, idempotent: true)
    end

    # Actualizar un gasto
    #
    # Cambia solo lo que manda. Al revisarla, rejected: true con reject_reason rechaza el gasto (no se paga ni se deduce) y false lo vuelve a incluir.
    #
    # POST /v1/expense_reports/{id}/items/{item}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/update-expense-item
    #
    # @param id [String]
    # @param item [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :category De qué es: hospedaje, alimentos, avion, transporte, auto, combustible (gasolina, casetas y estacionamiento),…
    # @option params [String] :date Cuándo se gastó.
    # @option params [String] :description Qué fue (el proveedor).
    # @option params [Numeric] :amount En pesos.
    # @option params [Numeric] :foreign_amount En su moneda, si fue en otra.
    # @option params [String] :foreign_currency La moneda (USD, EUR…).
    # @option params [Integer] :people En alimentos, cuántas personas comieron: el tope es por persona.
    # @option params [String] :payment Cómo se pagó: tarjeta_empresa (no se le reembolsa), tarjeta_propia, efectivo, transferencia u otro.
    # @option params [String] :receipt Su comprobante: cfdi, extranjero, ticket o ninguno.
    # @option params [String] :note Por qué, si pasa la política (la política puede pedirla).
    # @option params [Boolean] :rejected Al aprobar: true lo rechaza (no se paga ni se deduce), false lo vuelve a incluir.
    # @option params [String] :reject_reason Por qué se rechaza.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update_item(id, item, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/items/#{Core.path(item)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar un gasto
    #
    # Lo quita de la comprobación mientras no esté aprobada. Contesta la comprobación.
    #
    # DELETE /v1/expense_reports/{id}/items/{item}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/delete-expense-item
    #
    # @param id [String]
    # @param item [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_item(id, item, opts = nil, **kw)
      @client.call("DELETE", "/v1/expense_reports/#{Core.path(id)}/items/#{Core.path(item)}", nil, opts, kw)
    end

    # Registrar dinero dado o devuelto
    #
    # Un anticipo (antes de aprobarla), un reembolso o una devolución (ya aprobada). Con method nomina va en el siguiente recibo de nómina del empleado. Con el saldo en cero, una aprobada se cierra.
    #
    # POST /v1/expense_reports/{id}/movements
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/create-expense-movement
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :kind (obligatorio) anticipo (dinero que se le da antes o durante; hasta que se aprueba), reembolso (lo que la empresa le debe, y…
    # @option params [Numeric] :amount (obligatorio) En pesos.
    # @option params [String] :date (obligatorio) Cuándo se pagó.
    # @option params [String] :method transferencia (por omisión), efectivo, tarjeta o nomina (en el siguiente recibo de nómina del empleado; solo…
    # @option params [String] :reference Su referencia (folio de la transferencia).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_movement(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_reports/#{Core.path(id)}/movements", params, opts, kw, send: :body, idempotent: true)
    end

    # Deshacer un movimiento
    #
    # Lo quita (una cerrada vuelve a por liquidar). No uno que ya se pagó en la nómina.
    #
    # DELETE /v1/expense_reports/{id}/movements/{movement}
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/delete-expense-movement
    #
    # @param id [String]
    # @param movement [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete_movement(id, movement, opts = nil, **kw)
      @client.call("DELETE", "/v1/expense_reports/#{Core.path(id)}/movements/#{Core.path(movement)}", nil, opts, kw)
    end
  end

  # Viáticos y gastos: fiscalisto.expense_policy.
  class ExpensePolicyResource
    def initialize(client)
      @client = client
    end

    # Ver la política
    #
    # La política de viáticos y gastos del emisor: topes por categoría, hasta cuánto sin factura y los días para comprobar.
    #
    # GET /v1/expense_policy
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/get-expense-policy
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/expense_policy", params, opts, kw, send: :query)
    end

    # Cambiar la política
    #
    # Cambia solo lo que manda; en limits, una categoría con null deja de tener tope. Un gasto que pasa un tope no se rechaza: se marca para quien aprueba.
    #
    # POST /v1/expense_policy
    # https://fiscalisto.com/docs/api/referencia/viaticos-y-gastos/update-expense-policy
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Hash] :limits Topes por categoría.
    # @option params [Numeric] :ticket_limit Hasta cuánto se acepta un gasto sin factura; 0: todos la piden.
    # @option params [Integer] :due_days Días después del regreso para comprobar.
    # @option params [Boolean] :note_over_limit Pedir una nota en cada gasto que pase un tope.
    # @option params [Boolean] :notify_approvers Avisar por correo a quien aprueba cuando le envían una comprobación.
    # @option params [Boolean] :notify_people Avisar a la persona cuando se aprueba, se devuelve o se le paga.
    # @option params [Array] :receipt_formats Cómo se suben los tickets y recibos: image (foto), pdf o los dos.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/expense_policy", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Clientes: fiscalisto.customer_data_requests.
  class CustomerDataRequestsResource
    def initialize(client)
      @client = client
    end

    # Pedirle sus datos fiscales a un cliente
    #
    # Una liga (url) que usted le manda a su cliente: la abre en fiscalisto.com y da su RFC, nombre, régimen, código postal y uso, escritos o leídos de su constancia, revisados antes de aceptarlos. Al mandarlos llega customer_data_request.completed. Un cliente nuevo queda en el catálogo del emisor; si ya existía con otros datos, los nuevos vienen en submission para que usted los aplique.
    #
    # POST /v1/customer_data_requests
    # https://fiscalisto.com/docs/api/referencia/clientes/create-customer-data-request
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…) que va a facturarle.
    # @option params [String] :reference Su id para este cliente o pedido, como «Pedido 1042».
    # @option params [String] :description Una línea que el cliente ve arriba del formulario: para qué son sus datos.
    # @option params [Integer] :expires_in_days Días que la liga sirve, de 1 a 60.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/customer_data_requests", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar solicitudes de datos
    #
    # Las ligas para pedir datos fiscales, las más recientes primero, con su estado.
    #
    # GET /v1/customer_data_requests
    # https://fiscalisto.com/docs/api/referencia/clientes/list-customer-data-requests
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/customer_data_requests", params, opts, kw)
    end

    # Ver una solicitud de datos
    #
    # Una solicitud de datos: su liga y, si el cliente ya contestó, sus datos fiscales y el cliente que se guardó.
    #
    # GET /v1/customer_data_requests/{id}
    # https://fiscalisto.com/docs/api/referencia/clientes/get-customer-data-request
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/customer_data_requests/#{Core.path(id)}", nil, opts, kw)
    end

    # Cancelar una solicitud de datos
    #
    # La liga deja de funcionar. Una que el cliente ya contestó no se cancela.
    #
    # DELETE /v1/customer_data_requests/{id}
    # https://fiscalisto.com/docs/api/referencia/clientes/cancel-customer-data-request
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/customer_data_requests/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Productos: fiscalisto.products.
  class ProductsResource
    def initialize(client)
      @client = client
    end

    # Crear un producto
    #
    # Un producto o servicio del catálogo del emisor, con su clave del SAT, su unidad, su precio y sus impuestos, para usarlo en items con product.
    #
    # POST /v1/products
    # https://fiscalisto.com/docs/api/referencia/productos/create-product
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :name Nombre corto para encontrarlo, solo para usted; en el CFDI va description.
    # @option params [String] :description (obligatorio) Descripción.
    # @option params [String] :product_key (obligatorio) Clave del producto o servicio (ClaveProdServ), 8 dígitos de c_ClaveProdServ.
    # @option params [String] :unit_key Clave de unidad (ClaveUnidad) de c_ClaveUnidad: E48 unidad de servicio, H87 pieza, ACT actividad… Por omisión…
    # @option params [String] :unit_name Nombre de la unidad (Unidad), hasta 20 caracteres.
    # @option params [String] :sku Número de identificación o SKU (NoIdentificacion).
    # @option params [Numeric] :unit_price Precio unitario antes de impuestos (ValorUnitario).
    # @option params [Boolean] :open_price Precio abierto: sin precio fijo (una noche de hotel que cambia cada día); cada factura manda su unit_price.
    # @option params [String] :taxability Objeto de impuesto (ObjetoImp), c_ObjetoImp: 01 no objeto, 02 sí objeto (por omisión), 03 sin desglose, 04 no…
    # @option params [String] :iva Tasa de IVA trasladado: "0.16" (por omisión), "0.08" (región fronteriza), "0" o "exento".
    # @option params [Numeric] :ieps IEPS trasladado: tasa (0.265…) o cuota en pesos por unidad, según ieps_factor.
    # @option params [String] :ieps_factor Tasa o Cuota (TipoFactor del IEPS).
    # @option params [Numeric] :iva_retention Tasa de IVA retenido, en fracción (por ejemplo 0.106667, dos terceras partes del 16%).
    # @option params [Numeric] :isr_retention Tasa de ISR retenido, en fracción (por ejemplo 0.10 honorarios, 0.0125 RESICO).
    # @option params [Array] :local_taxes Impuestos locales que lleva, como el ISH 3% de hospedaje: van en cada factura con él, sobre sus conceptos.
    # @option params [Hash] :hydrocarbon Diésel (15101505) y gasolinas (15101514, 15101515): el permiso de la CNE que lleva cada factura con él en el…
    # @option params [Boolean] :track_stock Lleva existencias (Inventario): cada factura que lo vende las saca del almacén de su sucursal, y una cancelad…
    # @option params [Numeric] :cost Su costo por unidad en pesos sin IVA, hasta que sus compras den otro: vale las existencias que entran sin uni…
    # @option params [String] :barcode Código de barras (EAN, UPC o el suyo).
    # @option params [Numeric] :min_stock Existencia mínima: por debajo, el aviso de existencias bajas lo incluye.
    # @option params [Boolean] :portal_visible Se vende en el Portal del cliente: sus clientes lo piden desde ahí, a sus precios (listas de precios), y el p…
    # @option params [Numeric] :min_order_qty Lo menos que se le pide desde el portal, en su unidad.
    # @option params [Numeric] :order_step Se pide de tantos en tantos desde el portal (12: de 12 en 12).
    # @option params [String] :category Su categoría, con las de arriba separadas por › (también > o /): «Ferretería › Tornillos».
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/products", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar productos
    #
    # Los productos del emisor, los más recientes primero. Filtre por sku, product_key o category.
    #
    # GET /v1/products
    # https://fiscalisto.com/docs/api/referencia/productos/list-products
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :sku Solo el de este SKU.
    # @option params [String] :product_key Solo los de esta clave del SAT.
    # @option params [String] :category Solo los de esta categoría y sus subcategorías: «Ferretería» o «Ferretería › Tornillos».
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/products", params, opts, kw)
    end

    # Buscar productos
    #
    # Con un lenguaje de búsqueda, como el de Stripe: campo:'valor' (igual, sin importar mayúsculas), campo~'valor' (contiene, 3 caracteres o más), >, >=, < y <= en números y fechas, -campo:'valor' (no) y campo:null; hasta 10 cláusulas unidas con AND o con OR. Se busca por name, description, sku, product_key, unit_key, unit_price, created y metadata (metadata['order_id']:'123', con la llave entre corchetes). Los más recientes primero, por páginas como las listas. Una búsqueda que no se entiende responde search_query_invalid diciendo dónde.
    #
    # GET /v1/products/search
    # https://fiscalisto.com/docs/api/referencia/productos/search-products
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :query (obligatorio) La búsqueda, por ejemplo description~'tornillo' AND unit_price<10.
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def search(params = nil, opts = nil, **kw)
      @client.list_call("/v1/products/search", params, opts, kw)
    end

    # Ver un producto
    #
    # Un producto del catálogo.
    #
    # GET /v1/products/{id}
    # https://fiscalisto.com/docs/api/referencia/productos/get-product
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/products/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un producto
    #
    # Cambia solo los campos que manda. Las facturas ya timbradas no cambian.
    #
    # POST /v1/products/{id}
    # https://fiscalisto.com/docs/api/referencia/productos/update-product
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :name Nombre corto para encontrarlo, solo para usted; en el CFDI va description.
    # @option params [String] :description Descripción.
    # @option params [String] :product_key Clave del producto o servicio (ClaveProdServ), 8 dígitos de c_ClaveProdServ.
    # @option params [String] :unit_key Clave de unidad (ClaveUnidad) de c_ClaveUnidad: E48 unidad de servicio, H87 pieza, ACT actividad… Por omisión…
    # @option params [String] :unit_name Nombre de la unidad (Unidad), hasta 20 caracteres.
    # @option params [String] :sku Número de identificación o SKU (NoIdentificacion).
    # @option params [Numeric] :unit_price Precio unitario antes de impuestos (ValorUnitario).
    # @option params [Boolean] :open_price Precio abierto: sin precio fijo (una noche de hotel que cambia cada día); cada factura manda su unit_price.
    # @option params [String] :taxability Objeto de impuesto (ObjetoImp), c_ObjetoImp: 01 no objeto, 02 sí objeto (por omisión), 03 sin desglose, 04 no…
    # @option params [String] :iva Tasa de IVA trasladado: "0.16" (por omisión), "0.08" (región fronteriza), "0" o "exento".
    # @option params [Numeric] :ieps IEPS trasladado: tasa (0.265…) o cuota en pesos por unidad, según ieps_factor.
    # @option params [String] :ieps_factor Tasa o Cuota (TipoFactor del IEPS).
    # @option params [Numeric] :iva_retention Tasa de IVA retenido, en fracción (por ejemplo 0.106667, dos terceras partes del 16%).
    # @option params [Numeric] :isr_retention Tasa de ISR retenido, en fracción (por ejemplo 0.10 honorarios, 0.0125 RESICO).
    # @option params [Array] :local_taxes Impuestos locales que lleva, como el ISH 3% de hospedaje: van en cada factura con él, sobre sus conceptos.
    # @option params [Hash] :hydrocarbon Diésel (15101505) y gasolinas (15101514, 15101515): el permiso de la CNE que lleva cada factura con él en el…
    # @option params [Boolean] :track_stock Lleva existencias (Inventario): cada factura que lo vende las saca del almacén de su sucursal, y una cancelad…
    # @option params [Numeric] :cost Su costo por unidad en pesos sin IVA, hasta que sus compras den otro: vale las existencias que entran sin uni…
    # @option params [String] :barcode Código de barras (EAN, UPC o el suyo).
    # @option params [Numeric] :min_stock Existencia mínima: por debajo, el aviso de existencias bajas lo incluye.
    # @option params [Boolean] :portal_visible Se vende en el Portal del cliente: sus clientes lo piden desde ahí, a sus precios (listas de precios), y el p…
    # @option params [Numeric] :min_order_qty Lo menos que se le pide desde el portal, en su unidad.
    # @option params [Numeric] :order_step Se pide de tantos en tantos desde el portal (12: de 12 en 12).
    # @option params [String] :category Su categoría, con las de arriba separadas por › (también > o /): «Ferretería › Tornillos».
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/products/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un producto
    #
    # Lo quita del catálogo. Las facturas que lo usaron siguen igual.
    #
    # DELETE /v1/products/{id}
    # https://fiscalisto.com/docs/api/referencia/productos/delete-product
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/products/#{Core.path(id)}", nil, opts, kw)
    end

    # Ver las existencias de un producto
    #
    # Lo que hay del producto en cada almacén del emisor (también en 0), apartado por cotizaciones y disponible.
    #
    # GET /v1/products/{id}/stock
    # https://fiscalisto.com/docs/api/referencia/inventario/get-product-stock
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def stock(id, opts = nil, **kw)
      @client.call("GET", "/v1/products/#{Core.path(id)}/stock", nil, opts, kw)
    end
  end

  # Cumplimiento SAT: fiscalisto.sat_mailbox_messages.
  class SatMailboxMessagesResource
    def initialize(client)
      @client = client
    end

    # Listar avisos del buzón tributario
    #
    # Los avisos que trajo del buzón del emisor, los más recientes primero. No usa timbres.
    #
    # GET /v1/sat_mailbox_messages
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/list-sat-mailbox-messages
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Boolean] :unread true para solo los no leídos en el SAT, false para los leídos.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_mailbox_messages", params, opts, kw)
    end

    # Ver un aviso del buzón tributario
    #
    # Un aviso del buzón, con su urgencia y si pide hacer algo.
    #
    # GET /v1/sat_mailbox_messages/{id}
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-sat-mailbox-message
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_mailbox_messages/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Cumplimiento SAT: fiscalisto.sat_findings.
  class SatFindingsResource
    def initialize(client)
      @client = client
    end

    # Listar hallazgos en los CFDI
    #
    # Lo que Fiscalisto encontró en los CFDI del emisor (los suyos y los descargados del SAT) y nadie ha revisado, por tipo y del más grave al más leve: proveedores en la lista 69-B, CFDI cancelados, pagos en efectivo de más de $2,000, errores de CFDI 4.0. Todos en una página. No usa timbres.
    #
    # GET /v1/sat_findings
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/list-sat-findings
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :direction issued (emitidos) o received (recibidos); sin él, los dos.
    # @option params [String] :date[gte] De los CFDI con fecha desde, incluido.
    # @option params [String] :date[gt] De los CFDI con fecha después de, sin incluirlo.
    # @option params [String] :date[lte] De los CFDI con fecha hasta, incluido.
    # @option params [String] :date[lt] De los CFDI con fecha antes de, sin incluirlo.
    # @option params [String] :severity Solo los de esta gravedad: critical, warning o info.
    # @option params [String] :counterparty Solo los CFDI de este proveedor o cliente (su RFC): qué hallazgos tiene.
    # @option params [String] :date_gte Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :date_lte Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sat_findings", params, opts, kw, send: :query)
    end
  end

  # Cumplimiento SAT: fiscalisto.sat_finding_counterparties.
  class SatFindingCounterpartiesResource
    def initialize(client)
      @client = client
    end

    # Listar proveedores y clientes con hallazgos
    #
    # Los proveedores (en recibidos) y clientes (en emitidos) con hallazgos sin revisar en los CFDI del emisor, del más grave al más leve y después por cuántos CFDI, cada uno con sus tipos de hallazgo. Con code, quién tiene ese hallazgo. No usa timbres.
    #
    # GET /v1/sat_finding_counterparties
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/list-sat-finding-counterparties
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :direction issued (emitidos: clientes) o received (recibidos: proveedores); sin él, los dos.
    # @option params [String] :date[gte] De los CFDI con fecha desde, incluido.
    # @option params [String] :date[gt] De los CFDI con fecha después de, sin incluirlo.
    # @option params [String] :date[lte] De los CFDI con fecha hasta, incluido.
    # @option params [String] :date[lt] De los CFDI con fecha antes de, sin incluirlo.
    # @option params [String] :severity Solo los de esta gravedad: critical, warning o info.
    # @option params [String] :code Solo quienes tienen este hallazgo (efos_definitivo, cancelado, regla_12…; el code de GET /v1/sat_findings).
    # @option params [String] :date_gte Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :date_lte Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_finding_counterparties", params, opts, kw)
    end
  end

  # Cumplimiento SAT: fiscalisto.company_report.
  class CompanyReportResource
    def initialize(client)
      @client = client
    end

    # Ver el reporte de la empresa
    #
    # Como Impuestos y SAT › Reporte de la empresa en la app: la salud fiscal del emisor en una calificación de 0 a 1,000 con la razón de cada factor, los indicadores de riesgo contra su umbral, los años lado a lado (ingresos, gastos, PUE y PPD, días de cobro y pago, margen), sus principales clientes y proveedores con su concentración (HHI), sus socios por los CFDI de retenciones por dividendos y los clientes y proveedores que publicaron su liquidación o fusión. Sale de lo que Fiscalisto ya tiene: no consulta al SAT y no usa timbres. Sin fechas, los últimos 12 meses.
    #
    # GET /v1/company_report
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-company-report
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :date_gte Desde este día (AAAA-MM-DD).
    # @option params [String] :date_lte Hasta este día (AAAA-MM-DD, completo; hoy a lo más).
    # @option params [String] :version full (por omisión) o executive: solo la calificación, los indicadores principales, los años y 5 clientes y pr…
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/company_report", params, opts, kw, send: :query)
    end
  end

  # Cumplimiento SAT: fiscalisto.materiality_suppliers.
  class MaterialitySuppliersResource
    def initialize(client)
      @client = client
    end

    # Listar la materialidad por proveedor
    #
    # Como Materialidad en la app: los proveedores de las facturas recibidas (ingresos) del emisor en un periodo, con cuánto de lo que facturaron tiene evidencia completa de que la operación existió (acuerdo, entrega y pago). Primero los que están en 69-B definitivo (corre su plazo de 30 días hábiles), después los de más importe sin probar. Una página, hasta 500. Sin fechas, este año hasta hoy. No usa timbres.
    #
    # GET /v1/materiality_suppliers
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/list-materiality-suppliers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :date[gte] De las facturas con fecha desde, incluido.
    # @option params [String] :date[gt] De las facturas con fecha después de, sin incluirlo.
    # @option params [String] :date[lte] De las facturas con fecha hasta, incluido.
    # @option params [String] :date[lt] De las facturas con fecha antes de, sin incluirlo.
    # @option params [String] :supplier_tax_id Solo este proveedor (su RFC).
    # @option params [String] :date_gte Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :date_lte Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/materiality_suppliers", params, opts, kw, send: :query)
    end
  end

  # Cumplimiento SAT: fiscalisto.materiality_invoices.
  class MaterialityInvoicesResource
    def initialize(client)
      @client = client
    end

    # Listar facturas recibidas por probar
    #
    # Las facturas recibidas (ingresos) del emisor en un periodo que no tienen su evidencia completa, de mayor a menor importe, cada una con lo que tiene, lo que le falta y de dónde salió cada evidencia (orden de compra, recepción, complemento de pago, banco, archivos). Con state, solo las de ese estado. Una página, hasta 300; has_more dice que hay más (acorte el periodo o filtre por proveedor). No usa timbres.
    #
    # GET /v1/materiality_invoices
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/list-materiality-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :date[gte] Facturas con fecha desde, incluido.
    # @option params [String] :date[gt] Facturas con fecha después de, sin incluirlo.
    # @option params [String] :date[lte] Facturas con fecha hasta, incluido.
    # @option params [String] :date[lt] Facturas con fecha antes de, sin incluirlo.
    # @option params [String] :supplier_tax_id Solo las de este proveedor (su RFC).
    # @option params [String] :state Solo las de este estado: complete, partial o none.
    # @option params [String] :date_gte Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :date_lte Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/materiality_invoices", params, opts, kw, send: :query)
    end
  end

  # Cumplimiento SAT: fiscalisto.sat_reviews.
  class SatReviewsResource
    def initialize(client)
      @client = client
    end

    # Registrar una revisión del SAT
    #
    # Como «Registrar oficio» en Revisiones del SAT: una carta invitación, requerimiento u oficio que el SAT mandó al RFC del emisor, con la fecha en que se lo notificaron. Fiscalisto calcula el plazo en días hábiles desde que surte efectos la notificación (sin sábados, domingos ni los inhábiles del SAT) y avisa por correo 5, 3 y 1 día hábil antes. Sin requests, lleva lo que el SAT suele pedir en ese tipo. No responde nada al SAT. No usa timbres.
    #
    # POST /v1/sat_reviews
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/create-sat-review
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :type (obligatorio) Qué le llegó: invitation_letter, return_clarification, missing_returns, desk_audit (revisión de gabinete), fi…
    # @option params [Array] :notices (obligatorio) Sus oficios con su fecha de notificación: el que la abrió y los que siguieron (prórroga, segundo requerimient…
    # @option params [Array] :requests Lo que el oficio pide entregar.
    # @option params [String] :status open (por atender, por omisión), answered, concluded (sin observaciones), assessed (con crédito fiscal), in_d…
    # @option params [String] :reference El número del oficio, como viene en él (por ejemplo 500-05-2026-1234).
    # @option params [String] :order_number El número de orden (ABC1234567/26) o de trámite (AB123456789012) si pide la contabilidad electrónica: va en s…
    # @option params [String] :authority La autoridad que lo firma (por ejemplo «ADAF de Occidente»).
    # @option params [String] :period_start Primer día del periodo que revisa.
    # @option params [String] :period_end Último día del periodo que revisa (a lo más 7 ejercicios).
    # @option params [Numeric] :amount El monto que señala el SAT, en pesos, si señala uno.
    # @option params [String] :notes Sus notas.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_reviews", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar revisiones del SAT
    #
    # Las revisiones del RFC del emisor, primero las que siguen abiertas, después las más recientes, cada una con su plazo y lo que pide. Una página, hasta 500.
    #
    # GET /v1/sat_reviews
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/list-sat-reviews
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo las de este estado: open, answered, concluded, assessed, in_defense o closed.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sat_reviews", params, opts, kw, send: :query)
    end

    # Ver una revisión del SAT
    #
    # Una revisión con cada oficio y su plazo, lo que pide con cuánto de eso tiene Fiscalisto (ready de total) y su última respuesta armada.
    #
    # GET /v1/sat_reviews/{id}
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-sat-review
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_reviews/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una revisión del SAT
    #
    # Cambia solo lo que manda. notices y requests reemplazan la lista: mande todos sus oficios (con answered_on en el que ya respondió) y todo lo que pide (con done en lo que ya tiene).
    #
    # POST /v1/sat_reviews/{id}
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/update-sat-review
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :type Qué le llegó (vea type al crearla).
    # @option params [Array] :notices Todos sus oficios: reemplaza los que tenía.
    # @option params [Array] :requests Todo lo que pide, con done para marcar lo que ya tiene: reemplaza la lista.
    # @option params [String] :status open (por atender, por omisión), answered, concluded (sin observaciones), assessed (con crédito fiscal), in_d…
    # @option params [String] :reference El número del oficio, como viene en él (por ejemplo 500-05-2026-1234).
    # @option params [String] :order_number El número de orden (ABC1234567/26) o de trámite (AB123456789012) si pide la contabilidad electrónica: va en s…
    # @option params [String] :authority La autoridad que lo firma (por ejemplo «ADAF de Occidente»).
    # @option params [String] :period_start Primer día del periodo que revisa.
    # @option params [String] :period_end Último día del periodo que revisa (a lo más 7 ejercicios).
    # @option params [Numeric] :amount El monto que señala el SAT, en pesos, si señala uno.
    # @option params [String] :notes Sus notas.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_reviews/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una revisión del SAT
    #
    # Borra de Fiscalisto el seguimiento, sus avisos y los enlaces de sus asesores; su trámite en el SAT sigue igual. No se puede deshacer.
    #
    # DELETE /v1/sat_reviews/{id}
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/delete-sat-review
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/sat_reviews/#{Core.path(id)}", nil, opts, kw)
    end

    # Armar la respuesta
    #
    # Como «Armar respuesta»: arma en segundo plano un ZIP con lo que la revisión pide: los XML y la relación de CFDI del periodo, el papel de trabajo, la contabilidad electrónica con el número de orden, las declaraciones, los documentos subidos en la app y un índice de qué archivo responde a cada cosa. Contesta la revisión con answer.status processing; consulte GET /v1/sat_reviews/{id} hasta que sea completed y descárguelo con GET /v1/sat_reviews/{id}/answer. Una a la vez (answer_running). No usa timbres.
    #
    # POST /v1/sat_reviews/{id}/answer
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/arm-sat-review-answer
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def arm_answer(id, opts = nil, **kw)
      @client.call("POST", "/v1/sat_reviews/#{Core.path(id)}/answer", nil, opts, kw, idempotent: true)
    end

    # Descargar la respuesta
    #
    # El ZIP de la última respuesta armada, cuando answer.status es completed (si no, answer_not_ready). Se guarda 30 días.
    #
    # GET /v1/sat_reviews/{id}/answer
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/download-sat-review-answer
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def download_answer(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_reviews/#{Core.path(id)}/answer", nil, opts, kw, result: :bytes)
    end
  end

  # Cumplimiento SAT: fiscalisto.sat_risk_check.
  class SatRiskCheckResource
    def initialize(client)
      @client = client
    end

    # Revisar como el SAT
    #
    # Como «Revise como el SAT»: lo que los sistemas del SAT cruzan para mandar cartas invitación y escoger a quién revisar (plazos de revisiones abiertas, Buzón Tributario, CFDI contra declaraciones, declaraciones omitidas, opinión de cumplimiento, listas del SAT, proveedores en 69-B, materialidad, depósitos sin aclarar, discrepancia fiscal y vigencia de la e.firma), con lo que Fiscalisto ya leyó. No consulta al SAT y no usa timbres.
    #
    # GET /v1/sat_risk_check
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-sat-risk-check
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sat_risk_check", params, opts, kw, send: :query)
    end
  end

  # Cumplimiento SAT: fiscalisto.tax_discrepancy.
  class TaxDiscrepancyResource
    def initialize(client)
      @client = client
    end

    # Calcular la discrepancia fiscal
    #
    # Como «Discrepancia fiscal» (personas físicas, art. 91 LISR): gastos con CFDI a su nombre y depósitos en sus cuentas del año, menos traspasos entre sus cuentas, préstamos y devoluciones, contra los ingresos declarados; lo que queda es lo que el SAT presumiría ingreso. Un emisor persona moral contesta parameter_invalid. No usa timbres.
    #
    # GET /v1/tax_discrepancy
    # https://fiscalisto.com/docs/api/referencia/cumplimiento-sat/get-tax-discrepancy
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year El ejercicio (por omisión, el año pasado).
    # @option params [Numeric] :declared_income Los ingresos de su declaración anual, si tiene ingresos que Fiscalisto no ve (rentas, intereses, otro patrón)…
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/tax_discrepancy", params, opts, kw, send: :query)
    end
  end

  # Inventario: fiscalisto.warehouses.
  class WarehousesResource
    def initialize(client)
      @client = client
    end

    # Listar almacenes
    #
    # Los almacenes del emisor, los más recientes primero: el de la Matriz y uno por sucursal se crean solos. Todos en una página.
    #
    # GET /v1/warehouses
    # https://fiscalisto.com/docs/api/referencia/inventario/list-warehouses
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Boolean] :include_archived true para incluir los archivados.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/warehouses", params, opts, kw, send: :query)
    end

    # Ver un almacén
    #
    # Un almacén del emisor.
    #
    # GET /v1/warehouses/{id}
    # https://fiscalisto.com/docs/api/referencia/inventario/get-warehouse
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/warehouses/#{Core.path(id)}", nil, opts, kw)
    end

    # Ver las existencias de un almacén
    #
    # Lo que hay de cada producto en el almacén, el producto más reciente primero. Solo los que tienen existencias, salvo con include_empty=true (todos los que llevan track_stock).
    #
    # GET /v1/warehouses/{id}/stock
    # https://fiscalisto.com/docs/api/referencia/inventario/list-warehouse-stock
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [Boolean] :include_empty true para incluir los productos con track_stock que están en 0.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def stock(id, params = nil, opts = nil, **kw)
      @client.list_call("/v1/warehouses/#{Core.path(id)}/stock", params, opts, kw)
    end
  end

  # Inventario: fiscalisto.stock_movements.
  class StockMovementsResource
    def initialize(client)
      @client = client
    end

    # Listar movimientos (kárdex)
    #
    # Cada entrada y salida de existencias, la más reciente primero: ventas (de sus facturas), compras, ajustes, traspasos y lo que deshizo una cancelación.
    #
    # GET /v1/stock_movements
    # https://fiscalisto.com/docs/api/referencia/inventario/list-stock-movements
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :product Solo los de este producto (prd_…).
    # @option params [String] :warehouse Solo los de este almacén (whs_…).
    # @option params [String] :type Solo los de este tipo.
    # @option params [String] :date[gte] Con fecha desde, incluido.
    # @option params [String] :date[gt] Con fecha después de, sin incluirlo.
    # @option params [String] :date[lte] Con fecha hasta, incluido.
    # @option params [String] :date[lt] Con fecha antes de, sin incluirlo.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [String] :date_gte Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :date_lte Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/stock_movements", params, opts, kw)
    end

    # Ver un movimiento
    #
    # Una entrada o salida de existencias, con lo que la causó (source).
    #
    # GET /v1/stock_movements/{id}
    # https://fiscalisto.com/docs/api/referencia/inventario/get-stock-movement
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/stock_movements/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Inventario: fiscalisto.stock_adjustments.
  class StockAdjustmentsResource
    def initialize(client)
      @client = client
    end

    # Ajustar existencias
    #
    # Mete o saca existencias de un almacén con su motivo: el inventario inicial, una merma, un robo, un sobrante. Las entradas valen su unit_cost (o el costo promedio), las salidas el costo del emisor (promedio o PEPS). Los productos deben llevar track_stock: true. Se aplica al momento (status applied).
    #
    # POST /v1/stock_adjustments
    # https://fiscalisto.com/docs/api/referencia/inventario/create-stock-adjustment
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :warehouse El almacén (whs_…).
    # @option params [String] :reason (obligatorio) Por qué: shrinkage (merma), theft (robo o extravío), damage (daño), expiration (caducidad), internal_use (uso…
    # @option params [String] :note Una nota, para el kárdex.
    # @option params [Array] :lines (obligatorio) Lo que entra o sale de cada producto, hasta 500 líneas.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/stock_adjustments", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar ajustes
    #
    # Los ajustes del emisor, los más recientes primero.
    #
    # GET /v1/stock_adjustments
    # https://fiscalisto.com/docs/api/referencia/inventario/list-stock-adjustments
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :warehouse Solo los de este almacén (whs_…).
    # @option params [String] :status applied, pending, rejected o reversed.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/stock_adjustments", params, opts, kw)
    end

    # Ver un ajuste
    #
    # Un ajuste de existencias, con sus líneas.
    #
    # GET /v1/stock_adjustments/{id}
    # https://fiscalisto.com/docs/api/referencia/inventario/get-stock-adjustment
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/stock_adjustments/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Inventario: fiscalisto.production_orders.
  class ProductionOrdersResource
    def initialize(client)
      @client = client
    end

    # Crear una orden de producción
    #
    # Una orden en borrador (status draft) para producir quantity de un producto con receta: sus components salen de la receta (la hoja de costo de Compras › Costos y márgenes) con su merma y rendimiento, y sus other_costs se escalan a la cantidad. Nada se mueve hasta iniciarla. Enciende Producción en el inventario si estaba apagada. Un producto sin receta: 400 inventory_refused.
    #
    # POST /v1/production_orders
    # https://fiscalisto.com/docs/api/referencia/inventario/create-production-order
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :product (obligatorio) Lo que va a producir (prd_…): un producto con receta (su hoja de costo en Compras › Costos y márgenes).
    # @option params [Numeric] :quantity (obligatorio) Cuántas unidades, en la unidad del producto.
    # @option params [String] :warehouse El almacén de donde salen los componentes (whs_…).
    # @option params [String] :destination_warehouse El almacén al que entra lo producido (whs_…).
    # @option params [String] :due_date Para cuándo (AAAA-MM-DD).
    # @option params [String] :note Una nota.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/production_orders", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar órdenes de producción
    #
    # Las órdenes del emisor, las más recientes primero.
    #
    # GET /v1/production_orders
    # https://fiscalisto.com/docs/api/referencia/inventario/list-production-orders
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :product Solo las de este producto (prd_…).
    # @option params [String] :status draft, in_process, completed o canceled (también se acepta cancelled).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/production_orders", params, opts, kw)
    end

    # Ver una orden de producción
    #
    # Una orden con sus componentes, sus otros costos y, al terminar, su costo por unidad.
    #
    # GET /v1/production_orders/{id}
    # https://fiscalisto.com/docs/api/referencia/inventario/get-production-order
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/production_orders/#{Core.path(id)}", nil, opts, kw)
    end

    # Iniciar una orden de producción
    #
    # Los componentes salen del almacén (status in_process), cada lote el que caduca primero, al costo del emisor (promedio o PEPS). Mande components para lo que de verdad se usó de alguno. Con existencias negativas en «No permitir», uno que no alcanza: 400 inventory_refused.
    #
    # POST /v1/production_orders/{id}/start
    # https://fiscalisto.com/docs/api/referencia/inventario/start-production-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :components Lo que de verdad se usó de algún componente; los que no mande salen como dice la orden.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def start(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/production_orders/#{Core.path(id)}/start", params, opts, kw, send: :body, idempotent: true)
    end

    # Terminar una orden de producción
    #
    # Lo producido entra al almacén destino a su costo real: (materials_cost + other_costs) ÷ quantity_made (status completed). Una en borrador se inicia antes con lo planeado.
    #
    # POST /v1/production_orders/{id}/complete
    # https://fiscalisto.com/docs/api/referencia/inventario/complete-production-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Numeric] :quantity_made Cuántas unidades salieron.
    # @option params [String] :lot El lote de lo producido, si el producto lleva lotes.
    # @option params [String] :expires_on La caducidad de ese lote (AAAA-MM-DD).
    # @option params [Array] :other_costs Los otros costos como de verdad fueron; por omisión, los de la receta.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def complete(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/production_orders/#{Core.path(id)}/complete", params, opts, kw, send: :body, idempotent: true)
    end

    # Cancelar una orden de producción
    #
    # Los componentes regresan a su almacén y lo producido sale (status canceled). Una ya cancelada: 400 inventory_refused.
    #
    # POST /v1/production_orders/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/inventario/cancel-production-order
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, opts = nil, **kw)
      @client.call("POST", "/v1/production_orders/#{Core.path(id)}/cancel", nil, opts, kw, idempotent: true)
    end
  end

  # Catálogos del SAT: fiscalisto.sat_catalogs.
  class SatCatalogsResource
    def initialize(client)
      @client = client
    end

    # Consultar un catálogo del SAT
    #
    # product_keys, unit_keys y customs_tariffs (fracciones arancelarias de Comercio Exterior, con su customs_unit) se buscan con q (texto o clave). Los demás vienen completos: tax_systems, cfdi_uses, payment_forms, payment_methods, relationship_types, cancellation_motives, export_types, tax_objects, retention_codes.
    #
    # GET /v1/sat_catalogs/{name}
    # https://fiscalisto.com/docs/api/referencia/catalogos-del-sat/get-sat-catalog
    #
    # @param name [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :q Qué buscar: palabras («consultoría») o una clave.
    # @option params [Integer] :limit Hasta cuántos, de 1 a 100 (búsquedas).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(name, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sat_catalogs/#{Core.path(name)}", params, opts, kw, send: :query)
    end
  end

  # Listas del SAT: fiscalisto.sat_lists.
  class SatListsResource
    def initialize(client)
      @client = client
    end

    # Revisar un RFC en las listas del SAT
    #
    # Si el RFC aparece en la lista 69-B (operaciones simuladas), 69-B Bis o del art. 69 (no localizados, créditos firmes, exigibles, cancelados, sentencias, CSD sin efectos). Las listas se actualizan cada día con los archivos del SAT. No usa timbres.
    #
    # GET /v1/sat_lists/{tax_id}
    # https://fiscalisto.com/docs/api/referencia/listas-del-sat/get-sat-list-check
    #
    # @param tax_id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(tax_id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_lists/#{Core.path(tax_id)}", nil, opts, kw)
    end

    # Revisar varios RFC en las listas del SAT
    #
    # Hasta 1,000 RFC en una solicitud, en el mismo orden en que los mandó (sin repetidos). No usa timbres.
    #
    # POST /v1/sat_lists/check
    # https://fiscalisto.com/docs/api/referencia/listas-del-sat/check-sat-lists
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :tax_ids (obligatorio) Los RFC a revisar, hasta 1000.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def check(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_lists/check", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Verificar comprobantes: fiscalisto.cfdi_verifications.
  class CfdiVerificationsResource
    def initialize(client)
      @client = client
    end

    # Verificar un CFDI en el SAT
    #
    # Si cualquier CFDI (suyo, de un proveedor o de un cliente) existe en el SAT y está vigente o cancelado, si se puede cancelar, y si su emisor y su receptor están en las listas del SAT. Mande su XML, el texto de su QR, o el UUID con los dos RFC y el total. Consulta el servicio público del SAT, sin e.firma. No usa timbres. En pruebas también consulta el SAT real: los comprobantes de prueba no están ahí y responden not_found.
    #
    # POST /v1/cfdi_verifications
    # https://fiscalisto.com/docs/api/referencia/verificar-comprobantes/verify-cfdi
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :xml El XML del CFDI, como texto.
    # @option params [String] :qr El texto del QR del PDF (https://verificacfdi.facturaelectronica.sat.gob.mx/default.aspx?id=…&re=…&rr=…&tt=…&…
    # @option params [String] :uuid El folio fiscal, sin XML ni QR.
    # @option params [String] :issuer_tax_id El RFC del emisor, sin XML ni QR.
    # @option params [String] :receiver_tax_id El RFC del receptor, sin XML ni QR.
    # @option params [Numeric] :total El total del comprobante, sin XML ni QR.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/cfdi_verifications", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Equipo: fiscalisto.members.
  class MembersResource
    def initialize(client)
      @client = client
    end

    # Listar miembros
    #
    # Quién entra a la empresa en la app, con su rol, sus permisos y los RFC y sucursales a su alcance, como Ajustes › Miembros. Todos, los más antiguos primero. Pide que quien creó la llave tenga el permiso de ver el equipo.
    #
    # GET /v1/members
    # https://fiscalisto.com/docs/api/referencia/equipo/list-members
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/members", params, opts, kw, send: :query)
    end

    # Ver un miembro
    #
    # Su rol, sus permisos (los agregados, los quitados y los que tiene al final) y su alcance.
    #
    # GET /v1/members/{id}
    # https://fiscalisto.com/docs/api/referencia/equipo/get-member
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/members/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar el acceso de un miembro
    #
    # Su rol, los permisos que se le agregan o quitan y los RFC y sucursales a su alcance; lo que no mande se queda como está. Nadie da más de lo que tiene quien creó la llave. Dar, quitar o tocar un permiso delicado (equipo, credenciales, seguridad, plan) contesta 403 team_change_requires_app: se hace en la app, que confirma la identidad.
    #
    # POST /v1/members/{id}
    # https://fiscalisto.com/docs/api/referencia/equipo/update-member
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :role El rol (id de GET /v1/roles, como admin, contador, facturista o uno suyo).
    # @option params [Boolean] :all_permissions true: todos los permisos, incluidos los que se agreguen después (además de los del rol).
    # @option params [Array] :permissions_added Permisos además de los del rol (GET /v1/permissions).
    # @option params [Array] :permissions_removed Permisos del rol que esta persona no tiene.
    # @option params [Array] :tax_ids Solo trabaja con estos RFC de la empresa.
    # @option params [Array] :branches Solo emite desde estas sucursales (brn_…, o "matriz" para el domicilio fiscal).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/members/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar a un miembro
    #
    # La persona deja de entrar a la empresa y sus invitaciones se cancelan; lo que hizo se queda con su nombre. Lo que le esperaba (pasos de aprobación que la nombran, aprobaciones pendientes, avisos, ausencias, viáticos que aprueba) pasa a `transfer_to` o, sin él, a cualquiera con el permiso. Siempre queda al menos un propietario; quitar a alguien con permisos delicados se hace en la app.
    #
    # DELETE /v1/members/{id}
    # https://fiscalisto.com/docs/api/referencia/equipo/delete-member
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :transfer_to El miembro (mem_…) que recibe su trabajo; sin él, cualquiera con permiso.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/members/#{Core.path(id)}", params, opts, kw, send: :query)
    end
  end

  # Equipo: fiscalisto.invitations.
  class InvitationsResource
    def initialize(client)
      @client = client
    end

    # Listar invitaciones
    #
    # Las invitaciones pendientes de la empresa, las más antiguas primero.
    #
    # GET /v1/invitations
    # https://fiscalisto.com/docs/api/referencia/equipo/list-invitations
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/invitations", params, opts, kw, send: :query)
    end

    # Invitar a alguien a la empresa
    #
    # Le manda un correo con un enlace para entrar a la empresa con ese rol, válido 7 días, como Invitar en Ajustes › Miembros. Invitar otra vez al mismo correo reemplaza la invitación. Una invitación con permisos delicados (equipo, credenciales, seguridad, plan) o como propietario se hace en la app.
    #
    # POST /v1/invitations
    # https://fiscalisto.com/docs/api/referencia/equipo/create-invitation
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…) de la empresa.
    # @option params [String] :email (obligatorio) El correo de la persona: le llega la invitación, válida 7 días.
    # @option params [String] :role (obligatorio) El rol (id de GET /v1/roles, como admin, contador, facturista o uno suyo).
    # @option params [Boolean] :all_permissions true: todos los permisos, incluidos los que se agreguen después (además de los del rol).
    # @option params [Array] :permissions_added Permisos además de los del rol (GET /v1/permissions).
    # @option params [Array] :permissions_removed Permisos del rol que esta persona no tiene.
    # @option params [Array] :tax_ids Solo trabaja con estos RFC de la empresa.
    # @option params [Array] :branches Solo emite desde estas sucursales (brn_…, o "matriz" para el domicilio fiscal).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/invitations", params, opts, kw, send: :body, idempotent: true)
    end

    # Cancelar una invitación
    #
    # Su enlace deja de servir. Contesta la invitación con status canceled.
    #
    # DELETE /v1/invitations/{id}
    # https://fiscalisto.com/docs/api/referencia/equipo/cancel-invitation
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/invitations/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Equipo: fiscalisto.roles.
  class RolesResource
    def initialize(client)
      @client = client
    end

    # Listar roles
    #
    # Propietario, los roles de Fiscalisto (como se editaron en la empresa) y los suyos, con sus permisos y cuántas personas los tienen.
    #
    # GET /v1/roles
    # https://fiscalisto.com/docs/api/referencia/equipo/list-roles
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/roles", params, opts, kw, send: :query)
    end

    # Crear un rol
    #
    # Un rol de la empresa con su nombre y sus permisos (GET /v1/permissions), como Ajustes › Roles. No puede tener permisos que no tenga quien creó la llave; uno con permisos delicados se hace en la app.
    #
    # POST /v1/roles
    # https://fiscalisto.com/docs/api/referencia/equipo/create-role
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…) de la empresa.
    # @option params [String] :name (obligatorio) Como se ve en la app.
    # @option params [String] :description Descripción.
    # @option params [Boolean] :all_permissions true: todos los permisos, incluidos los que se agreguen después.
    # @option params [Array] :permissions Sus permisos (GET /v1/permissions).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/roles", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar un rol
    #
    # Su nombre, su descripción o sus permisos; lo que no mande se queda. Cambia el acceso de todos los que lo tienen. Propietario no se cambia.
    #
    # POST /v1/roles/{id}
    # https://fiscalisto.com/docs/api/referencia/equipo/update-role
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…) de la empresa.
    # @option params [String] :description Descripción.
    # @option params [Boolean] :all_permissions true: todos los permisos, incluidos los que se agreguen después.
    # @option params [Array] :permissions Sus permisos (GET /v1/permissions).
    # @option params [String] :name Como se ve en la app.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/roles/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un rol
    #
    # Solo uno de la empresa (type custom), cuando nadie lo tiene ni lo da una invitación pendiente.
    #
    # DELETE /v1/roles/{id}
    # https://fiscalisto.com/docs/api/referencia/equipo/delete-role
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/roles/#{Core.path(id)}", params, opts, kw, send: :query)
    end
  end

  # Equipo: fiscalisto.permissions.
  class PermissionsResource
    def initialize(client)
      @client = client
    end

    # Listar permisos
    #
    # Cada permiso que un rol o una persona puede tener, con su nombre en la app, su grupo y si es delicado.
    #
    # GET /v1/permissions
    # https://fiscalisto.com/docs/api/referencia/equipo/list-permissions
    #
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(opts = nil, **kw)
      @client.call("GET", "/v1/permissions", nil, opts, kw)
    end
  end

  # Exportaciones: fiscalisto.exports.
  class ExportsResource
    def initialize(client)
      @client = client
    end

    # Exportar las facturas de un mes
    #
    # Un ZIP con el XML (y si quiere el PDF) de cada factura que el emisor emitió o recibió en un mes o un periodo, o un Excel con una fila por factura: los mismos archivos que Facturas › Exportar en la app, para su contador, un respaldo o una auditoría. Contesta 202 de inmediato con status processing; consulte GET /v1/exports/{id} hasta completed y descárguelo con GET /v1/exports/{id}/download durante 30 días. No usa timbres y sirve con una llave de solo lectura.
    #
    # POST /v1/exports
    # https://fiscalisto.com/docs/api/referencia/exportaciones/create-export
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :month Un mes completo (AAAA-MM), por la fecha de emisión en hora de la Ciudad de México.
    # @option params [String] :from Desde qué día (incluido), en lugar de month.
    # @option params [String] :to Hasta qué día (incluido), en lugar de month.
    # @option params [String] :direction issued (las facturas que emitió el emisor, por omisión) o received (las que le hicieron).
    # @option params [String] :type Solo un tipo de comprobante: I, E, P, T o N.
    # @option params [String] :format zip (los archivos de cada factura, por omisión) o xlsx (un Excel con una fila por factura).
    # @option params [String] :files Con format zip: xml (por omisión), pdf, o xml_and_pdf (los dos de cada factura).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/exports", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar exportaciones
    #
    # Las exportaciones del emisor pedidas por la API, las más recientes primero.
    #
    # GET /v1/exports
    # https://fiscalisto.com/docs/api/referencia/exportaciones/list-exports
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/exports", params, opts, kw)
    end

    # Ver una exportación
    #
    # Su estado (processing, completed, failed o expired), cuántas facturas lleva, su tamaño y hasta cuándo se descarga.
    #
    # GET /v1/exports/{id}
    # https://fiscalisto.com/docs/api/referencia/exportaciones/get-export
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/exports/#{Core.path(id)}", nil, opts, kw)
    end

    # Descargar una exportación
    #
    # El ZIP o el Excel, cuando status es completed. Antes, 409 export_not_ready; pasados 30 días, 410 export_expired.
    #
    # GET /v1/exports/{id}/download
    # https://fiscalisto.com/docs/api/referencia/exportaciones/download-export
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def download(id, opts = nil, **kw)
      @client.call("GET", "/v1/exports/#{Core.path(id)}/download", nil, opts, kw, result: :bytes)
    end
  end

  # Descargas del SAT: fiscalisto.sat_downloads.
  class SatDownloadsResource
    def initialize(client)
      @client = client
    end

    # Pedirle al SAT las facturas de un emisor
    #
    # La descarga masiva del SAT: las facturas que el emisor recibió (o emitió) en un periodo de hasta un año, con su XML. Contesta 202 de inmediato; el SAT tarda de minutos a horas y al terminar llega sat_download.completed (o sat_download.failed) y las facturas quedan en GET /v1/sat_invoices. En producción necesita la e.firma guardada del emisor; en pruebas no se le pregunta al SAT: la descarga trae facturas de ejemplo al instante. En producción usa 1 timbre por cada 100 CFDI que trae (al menos 1).
    #
    # POST /v1/sat_downloads
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/create-sat-download
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :direction received (las facturas que le hicieron al emisor, por omisión) o issued (las que emitió, aunque no haya sido…
    # @option params [String] :from (obligatorio) Desde qué día (incluido), en hora de la Ciudad de México.
    # @option params [String] :to (obligatorio) Hasta qué día (incluido).
    # @option params [String] :type Solo un tipo de comprobante: I, E, P, T o N.
    # @option params [String] :counterparty_tax_id Solo las de un RFC: el emisor de las recibidas, o el receptor de las emitidas.
    # @option params [String] :uuid Una sola factura, por su folio fiscal (UUID).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_downloads", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar descargas del SAT
    #
    # Las descargas pedidas al SAT, las más recientes primero, con su estado.
    #
    # GET /v1/sat_downloads
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/list-sat-downloads
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_downloads", params, opts, kw)
    end

    # Ver una descarga del SAT
    #
    # Una descarga del SAT: su periodo, su estado y cuántos CFDI trajo. Al terminar llega sat_download.completed.
    #
    # GET /v1/sat_downloads/{id}
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-download
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_downloads/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Descargas del SAT: fiscalisto.sat_invoices.
  class SatInvoicesResource
    def initialize(client)
      @client = client
    end

    # Listar facturas del SAT
    #
    # Las facturas que trajeron sus descargas (y las demás que Fiscalisto tenga del emisor), de la más reciente a la más antigua por fecha.
    #
    # GET /v1/sat_invoices
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/list-sat-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :direction received (por omisión) o issued.
    # @option params [String] :type I, E, P, T o N.
    # @option params [String] :counterparty_tax_id El RFC de quien la emitió (recibidas) o de quien la recibió (emitidas).
    # @option params [String] :date[gte] Con fecha desde, incluido.
    # @option params [String] :date[gt] Con fecha después de, sin incluirlo.
    # @option params [String] :date[lte] Con fecha hasta, incluido.
    # @option params [String] :date[lt] Con fecha antes de, sin incluirlo.
    # @option params [String] :cost_center Solo las de este centro de costo (ccn_…), o none para las que no tienen.
    # @option params [String] :tag Solo las que llevan esta etiqueta (tag_…).
    # @option params [String] :cash_confirmation Solo las PUE recibidas en efectivo que la empresa pide confirmar: pending (nadie ha anotado de dónde salió el…
    # @option params [String] :date_gte Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :date_lte Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_invoices", params, opts, kw)
    end

    # Ver una factura del SAT
    #
    # Un CFDI que trajo una descarga del SAT, con sus importes y su estado ante el SAT.
    #
    # GET /v1/sat_invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_invoices/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una factura del SAT
    #
    # Lo que se puede cambiar de un CFDI del SAT sin tocarlo: su centro de costo (cost_center, o null para quitárselo), para ver sus gastos por obra, proyecto o área, y sus etiquetas (tags, exactamente las que manda: ids tag_… o nombres; un nombre nuevo crea la etiqueta).
    #
    # POST /v1/sat_invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/update-sat-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :cost_center Su centro de costo (ccn_…), o null para quitárselo.
    # @option params [Array] :tags Sus etiquetas, exactamente estas (hasta 10): ids (tag_…) o nombres; un nombre nuevo crea la etiqueta.
    # @option params [String] :account El número de cuenta de su catálogo en que se registra su ingreso o gasto («601-84-002»), en vez de la de su c…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_invoices/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar como pagada una factura recibida
    #
    # Una factura PPD recibida que la empresa pagó (en efectivo, de caja chica, con un reembolso…) y cuyo proveedor no emitió el complemento de pago: sale de Por pagar como pagada sin complemento, con cuándo, cómo y de dónde se pagó. El SAT la sigue viendo sin pagar: el IVA no se acredita ni el gasto se deduce hasta que llegue el complemento. En una PUE recibida, que ya está pagada, solo anota de dónde salió el dinero (money_source). Lo marcado se ve en paid_otherwise.
    #
    # POST /v1/sat_invoices/{id}/mark_paid
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/mark-sat-invoice-paid
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :paid_on El día en que se pagó (AAAA-MM-DD, no después de hoy).
    # @option params [String] :payment_form Solo PPD: con qué se pagó, clave c_FormaPago (01 efectivo, 02 cheque nominativo, 03 transferencia…).
    # @option params [String] :money_source De dónde salió el dinero: petty_cash (caja chica), reimbursement (lo pagó una persona y se le reembolsó), ban…
    # @option params [String] :note Una nota, hasta 500 caracteres.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_paid(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_invoices/#{Core.path(id)}/mark_paid", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar la marca de pagada
    #
    # Deshace mark_paid (o lo que marcó una regla de Pagos sin complemento): una PPD vuelve a Por pagar y una PUE pierde su origen del dinero. Una regla ya no la vuelve a marcar.
    #
    # POST /v1/sat_invoices/{id}/mark_unpaid
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/mark-sat-invoice-unpaid
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_unpaid(id, opts = nil, **kw)
      @client.call("POST", "/v1/sat_invoices/#{Core.path(id)}/mark_unpaid", nil, opts, kw, idempotent: true)
    end

    # Descargar el XML de una factura del SAT
    #
    # El CFDI tal como lo entregó el SAT.
    #
    # GET /v1/sat_invoices/{id}/xml
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-invoice-xml
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def xml(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_invoices/#{Core.path(id)}/xml", nil, opts, kw, result: :text)
    end

    # Descargar el PDF de una factura del SAT
    #
    # El CFDI en PDF, como lo ofrece Facturas: si se timbró en Fiscalisto, el mismo que recibió el cliente; si no, dibujado con el diseño de PDF del emisor (el de un proveedor, con su estilo y color, nunca con su logo). El XML es el documento válido ante el SAT.
    #
    # GET /v1/sat_invoices/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-invoice-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_invoices/#{Core.path(id)}/pdf", nil, opts, kw, result: :bytes)
    end
  end

  # Descargas del SAT: fiscalisto.sat_retentions.
  class SatRetentionsResource
    def initialize(client)
      @client = client
    end

    # Listar constancias de retenciones
    #
    # Los CFDI de retenciones e información de pagos del emisor, como los muestra Facturas › Retenciones: los que recibió (descargados del SAT o subidos) o los que emitió, del más reciente al más antiguo, con las canceladas marcadas. Las que emite por la API también están en GET /v1/retentions.
    #
    # GET /v1/sat_retentions
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/list-sat-retentions
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :direction received (por omisión) o issued.
    # @option params [String] :status active o canceled.
    # @option params [String] :counterparty_tax_id El RFC de quien retuvo (recibidas) o a quien le retuvo (emitidas).
    # @option params [String] :code Clave de la retención (CveRetenc) de dos dígitos, como 16 o 26.
    # @option params [Integer] :year Solo las de un ejercicio, como 2025.
    # @option params [Integer] :month Solo las que cubren este mes (1 a 12): una anual de enero a diciembre cubre todos.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_retentions", params, opts, kw)
    end

    # Ver una constancia de retenciones
    #
    # Una constancia de retenciones del emisor, con sus montos, impuestos y estado.
    #
    # GET /v1/sat_retentions/{id}
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-retention
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_retentions/#{Core.path(id)}", nil, opts, kw)
    end

    # Descargar el XML de una constancia de retenciones
    #
    # El CFDI de retenciones tal como llegó.
    #
    # GET /v1/sat_retentions/{id}/xml
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-retention-xml
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def xml(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_retentions/#{Core.path(id)}/xml", nil, opts, kw, result: :text)
    end

    # Descargar el PDF de una constancia de retenciones
    #
    # La constancia en PDF, como la ofrece Facturas › Retenciones. El XML es el documento válido ante el SAT.
    #
    # GET /v1/sat_retentions/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/get-sat-retention-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_retentions/#{Core.path(id)}/pdf", nil, opts, kw, result: :bytes)
    end

    # Cancelar una constancia de retenciones emitida
    #
    # Una que el emisor emitió (direction issued), también si la timbró desde otro sistema con el mismo PAC y solo llegó del SAT. Se cancela en el momento (no espera aceptación) y no usa timbres. Una que timbró otro PAC se cancela en el portal del SAT: contesta cancellation_failed y lo explica. Con motive 01, substitution es la constancia que la sustituye (su srt_… o su UUID).
    #
    # POST /v1/sat_retentions/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/descargas-del-sat/cancel-sat-retention
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :motive Motivo de cancelación (c_MotivoCancelacion): 01 con errores con relación (lleva substitution), 02 con errores…
    # @option params [String] :substitution El comprobante que sustituye a este (su id o su UUID), con el motivo 01.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_retentions/#{Core.path(id)}/cancel", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Portal de proveedores: fiscalisto.portal_suppliers.
  class PortalSuppliersResource
    def initialize(client)
      @client = client
    end

    # Listar proveedores del portal
    #
    # Los proveedores invitados o registrados en el Portal de proveedores del emisor, los más recientes primero: su alta, sus documentos, la cuenta a la que se le paga y su calificación.
    #
    # GET /v1/portal_suppliers
    # https://fiscalisto.com/docs/api/referencia/portal-de-proveedores/list-portal-suppliers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo los que estén en este estado.
    # @option params [String] :tax_id Solo el de este RFC.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/portal_suppliers", params, opts, kw)
    end

    # Ver un proveedor del portal
    #
    # Su alta, sus documentos, su cuenta bancaria y su calificación por partes.
    #
    # GET /v1/portal_suppliers/{id}
    # https://fiscalisto.com/docs/api/referencia/portal-de-proveedores/get-portal-supplier
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/portal_suppliers/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Portal de proveedores: fiscalisto.supplier_invoices.
  class SupplierInvoicesResource
    def initialize(client)
      @client = client
    end

    # Listar facturas de proveedores
    #
    # Las facturas que mandaron sus proveedores por el portal, las más recientes primero. Para llevar a su ERP lo aprobado: status=approved, o escuche supplier_invoice.approved.
    #
    # GET /v1/supplier_invoices
    # https://fiscalisto.com/docs/api/referencia/portal-de-proveedores/list-supplier-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo las que estén en este estado.
    # @option params [String] :supplier Solo las de este proveedor (sup_…).
    # @option params [String] :received[gte] Llegadas desde, incluido.
    # @option params [String] :received[gt] Llegadas después de, sin incluirlo.
    # @option params [String] :received[lte] Llegadas hasta, incluido.
    # @option params [String] :received[lt] Llegadas antes de, sin incluirlo.
    # @option params [String] :received_since Igual que received[gte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/supplier_invoices", params, opts, kw)
    end

    # Ver una factura de proveedor
    #
    # Con su estado, su orden de compra, su contrarecibo y sus fechas de pago. Su XML y su PDF: GET /v1/sat_invoices/{sat_invoice}/xml y /pdf.
    #
    # GET /v1/supplier_invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/portal-de-proveedores/get-supplier-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/supplier_invoices/#{Core.path(id)}", nil, opts, kw)
    end

    # Programar el pago de una factura de proveedor
    #
    # El día en que la pagará, como «Programar pago» en la app: el proveedor lo ve en su portal y llega supplier_invoice.scheduled. Solo una aprobada o ya programada; si el SAT la reporta cancelada, 400 supplier_invoice_invalid.
    #
    # POST /v1/supplier_invoices/{id}/schedule
    # https://fiscalisto.com/docs/api/referencia/portal-de-proveedores/schedule-supplier-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :pay_on (obligatorio) El día en que la pagará (AAAA-MM-DD, hoy o después).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def schedule(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/supplier_invoices/#{Core.path(id)}/schedule", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar pagada una factura de proveedor
    #
    # El pago que hizo su ERP o su banco, como «Marcar pagada» en la app: el proveedor lo ve, y si es PPD le pedimos su complemento de pago. Llega supplier_invoice.paid.
    #
    # POST /v1/supplier_invoices/{id}/mark_paid
    # https://fiscalisto.com/docs/api/referencia/portal-de-proveedores/mark-supplier-invoice-paid
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :paid_on (obligatorio) El día en que la pagó (AAAA-MM-DD, hoy o antes).
    # @option params [String] :reference La referencia del pago (la de la transferencia o del ERP), o null.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark_paid(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/supplier_invoices/#{Core.path(id)}/mark_paid", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Pagos a proveedores: fiscalisto.payable_invoices.
  class PayableInvoicesResource
    def initialize(client)
      @client = client
    end

    # Listar lo que falta por pagar
    #
    # Las facturas recibidas con algo por pagar, como Pagos › Por pagar, las más recientes primero; con uuid, esas facturas (pagadas o no). Lo pagado cuenta complementos, notas de crédito, pagos de Fiscalisto y pagos registrados a mano. Si el emisor no paga con Fintoc, 400 payouts_not_enabled.
    #
    # GET /v1/payable_invoices
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/list-payable-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Integer] :limit Cuántas, de 1 a 500.
    # @option params [String] :starting_after El id (folio fiscal) de la última de la página anterior, para la siguiente.
    # @option params [String] :supplier_tax_id Solo las de este proveedor (su RFC).
    # @option params [String] :uuid Solo estas: hasta 100 folios fiscales separados por comas.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/payable_invoices", params, opts, kw)
    end
  end

  # Pagos a proveedores: fiscalisto.payouts.
  class PayoutsResource
    def initialize(client)
      @client = client
    end

    # Preparar un pago a proveedores
    #
    # Un pago en borrador con estas facturas, revisado como en la app: las reglas antes de pagar, los límites y las cuentas aprobadas de cada proveedor. Las de un proveedor van en una transferencia. Nunca sale solo: alguien del equipo lo abre en app_url y lo firma con su llave de acceso. Solo si la empresa lo permite en Pagos › Configurar pagos (si no, 403 payouts_api_disabled); lo que no se puede pagar contesta 400 payout_invalid con el motivo. Pide Idempotency-Key: si la respuesta se pierde, repítala con el mismo valor y contesta el mismo pago, nunca uno nuevo. La misma llave con otra solicitud (otras facturas, montos o día) contesta 409 idempotency_key_reused, aunque hayan pasado más de 24 horas.
    #
    # POST /v1/payouts
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/create-payout
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :pay_on El día en que sale (AAAA-MM-DD, hoy o después).
    # @option params [String] :name El nombre del lote («Fletes»), para encontrarlo en la app entre los lotes abiertos.
    # @option params [String] :note Una nota para quien lo revisa y lo firma.
    # @option params [String] :exchange_rate En un pago programado con facturas en otra moneda: official (el tipo de cambio oficial; si al salir se movió…
    # @option params [Array] :invoices Las facturas recibidas a pagar (hasta 500).
    # @option params [Array] :payments Pagos sin factura (hasta 500 entre los dos arreglos): una nómina, un anticipo, un reembolso.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payouts", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar pagos a proveedores
    #
    # Los pagos del emisor, hechos en la app o por la API, los más recientes primero, con sus transferencias.
    #
    # GET /v1/payouts
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/list-payouts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo los que estén en este estado.
    # @option params [String] :pay_on[gte] Con fecha de pago desde, incluido.
    # @option params [String] :pay_on[gt] Con fecha de pago después de, sin incluirlo.
    # @option params [String] :pay_on[lte] Con fecha de pago hasta, incluido.
    # @option params [String] :pay_on[lt] Con fecha de pago antes de, sin incluirlo.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @option params [String] :pay_on_from Igual que pay_on[gte]; se conserva por compatibilidad.
    # @option params [String] :pay_on_to Igual que pay_on[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/payouts", params, opts, kw)
    end

    # Ver si los pagos están en pausa
    #
    # Si la empresa pausó todos sus pagos («Pausar todos los pagos»), desde cuándo y por qué.
    #
    # GET /v1/payouts/pause
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/get-payouts-pause
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get_pause(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payouts/pause", params, opts, kw, send: :query)
    end

    # Pausar todos los pagos
    #
    # El freno de emergencia de la empresa, para una herramienta de seguridad o el botón de su ERP: al instante no sale ninguna transferencia (pagos firmados, reintentos ni recurrentes) y les llega el aviso a los administradores con el motivo. La API nunca reanuda: lo firman en la app las personas de Quién firma, cada una con su llave de acceso. Solo si la empresa deja que la API trabaje con sus pagos en Pagos › Configurar pagos (si no, 403 payouts_api_disabled). Pausar lo que ya está en pausa no cambia nada.
    #
    # POST /v1/payouts/pause
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/pause-payouts
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer La empresa (iss_…); sin él, la de la llave.
    # @option params [String] :reason (obligatorio) Por qué se pausan los pagos; lo ve el equipo y llega en el aviso.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pause(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payouts/pause", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver un pago a proveedores
    #
    # Con sus firmas, cada transferencia, su clave de rastreo y su CEP cuando llega.
    #
    # GET /v1/payouts/{id}
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/get-payout
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/payouts/#{Core.path(id)}", nil, opts, kw)
    end

    # Cancelar un pago a proveedores
    #
    # Uno que prepararon las llaves de esta cuenta, mientras no ha salido nada (draft, pending_approval o approved): sus facturas vuelven a Por pagar y llega payout.canceled. Uno preparado en la app, o por otra cuenta API conectada a la empresa, se cancela ahí (400 payout_not_from_api).
    #
    # POST /v1/payouts/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/cancel-payout
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :reason Por qué se cancela; lo ve el equipo en el pago.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/payouts/#{Core.path(id)}/cancel", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Pagos a proveedores: fiscalisto.payee_accounts.
  class PayeeAccountsResource
    def initialize(client)
      @client = client
    end

    # Listar cuentas de proveedores
    #
    # Las cuentas a las que se les paga a sus proveedores, verificadas con el banco, y si ya se les puede pagar. Solo lectura: agregar o cambiar una CLABE se hace en la app, con su espera y su aprobación.
    #
    # GET /v1/payee_accounts
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/list-payee-accounts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :supplier_tax_id Solo las de este proveedor (su RFC).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payee_accounts", params, opts, kw, send: :query)
    end
  end

  # Pagos a proveedores: fiscalisto.payout_mandates.
  class PayoutMandatesResource
    def initialize(client)
      @client = client
    end

    # Listar pagos recurrentes
    #
    # Los pagos recurrentes firmados en la app (o por firmar): a qué cuenta, cuánto como máximo, qué día y qué meses, y los pagos que ya hicieron. Solo lectura.
    #
    # GET /v1/payout_mandates
    # https://fiscalisto.com/docs/api/referencia/pagos-a-proveedores/list-payout-mandates
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/payout_mandates", params, opts, kw, send: :query)
    end
  end

  # Declaraciones del SAT: fiscalisto.sat_declarations.
  class SatDeclarationsResource
    def initialize(client)
      @client = client
    end

    # Consultar las declaraciones de un emisor en el SAT
    #
    # Entra al SAT con la e.firma guardada del emisor y trae las declaraciones que presentó: provisionales o definitivas (desde 2022), la anual de persona moral (desde 2019) y las del servicio anterior Declaraciones y pagos, con su PDF, su acuse y sus cifras. La primera consulta trae todos los años que el SAT conserva; las siguientes, este año y el anterior. Solo consulta: nunca presenta ni firma nada. En producción usa 1 timbre por consulta y se puede hacer una vez cada 10 minutos por emisor. Contesta 202 en cuanto la acepta (status processing) y consulta al SAT en segundo plano: sat_refresh.completed o sat_refresh.failed dicen cómo terminó, y GET /v1/sat_refreshes/{id} también. Su timbre se aparta al aceptarla (sin timbres contesta 402 de inmediato), se usa cuando el SAT contesta y regresa si no contesta. Si al terminar queda algo por bajar (result.pending), sigue solo en la siguiente hora sin otro timbre. En pruebas no se le pregunta al SAT: trae declaraciones de ejemplo al instante (la consulta ya viene completed y también llega sat_refresh.completed).
    #
    # POST /v1/sat_declarations/refresh
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/refresh-sat-declarations
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def refresh(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sat_declarations/refresh", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar declaraciones del SAT
    #
    # Las declaraciones que trajeron sus consultas, del ejercicio y mes más recientes a los más antiguos (la anual antes de los meses de su año). No usa timbres.
    #
    # GET /v1/sat_declarations
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/list-sat-declarations
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year Solo las de un ejercicio, como 2025.
    # @option params [String] :source monthly (provisionales o definitivas), annual (la anual) o dyp (Declaraciones y pagos).
    # @option params [Integer] :month Solo las de un mes (1 a 12).
    # @option params [String] :type normal o complementary (complementarias).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_declarations", params, opts, kw)
    end

    # Ver el año mes por mes
    #
    # Cada mes del ejercicio con sus obligaciones: presentada (con sus declaraciones), falta (venció y no la encontramos) o por presentar, con el día en que vence (el 17 del mes siguiente, o el día hábil siguiente, más los días por el sexto dígito del RFC). Se arma con lo que trajeron sus consultas; no usa timbres.
    #
    # GET /v1/sat_declarations/calendar
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-declaration-calendar
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year El ejercicio, como 2026.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def calendar(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/calendar", params, opts, kw, send: :query)
    end

    # Ver la precarga de la anual de una persona física
    #
    # Lo que el SAT precargará en la declaración anual de un emisor persona física, de sus visores: los sueldos o asimilados y el ISR que le retuvieron, por patrón, y las deducciones personales que toma de sus facturas, con las que podrían deducirse y no toma, y por qué. Se lee con la e.firma en cada consulta (POST /v1/sat_declarations/refresh), del ejercicio anterior y del actual; no usa timbres. Un emisor persona moral recibe parameter_invalid.
    #
    # GET /v1/sat_declarations/annual_preload
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-annual-preload
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :year El ejercicio, como 2025.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def annual_preload(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/annual_preload", params, opts, kw, send: :query)
    end

    # Ver una declaración del SAT
    #
    # Una declaración presentada al SAT, con sus cifras en summary y si ya están su PDF y su acuse.
    #
    # GET /v1/sat_declarations/{id}
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-declaration
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/#{Core.path(id)}", nil, opts, kw)
    end

    # Descargar el PDF de una declaración
    #
    # La declaración como la da el SAT. No usa timbres.
    #
    # GET /v1/sat_declarations/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-declaration-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/#{Core.path(id)}/pdf", nil, opts, kw, result: :bytes)
    end

    # Descargar el acuse de una declaración
    #
    # El acuse de recibo, con la línea de captura si hay algo a pagar. No usa timbres.
    #
    # GET /v1/sat_declarations/{id}/receipt
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-declaration-receipt
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def receipt(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/#{Core.path(id)}/receipt", nil, opts, kw, result: :bytes)
    end

    # Descargar el registro del pago de una declaración
    #
    # La «Información registrada de pagos de contribuciones federales» de una declaración mensual pagada, como la da el SAT: el banco, el día, el importe, el número de operación del banco y la llave de pago. Existe cuando payment.status es paid. No usa timbres.
    #
    # GET /v1/sat_declarations/{id}/payment_record
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-declaration-payment-record
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def payment_record(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/#{Core.path(id)}/payment_record", nil, opts, kw, result: :bytes)
    end

    # Descargar los estados financieros de una anual
    #
    # El Excel de estados financieros de la anual de persona moral, como lo da el SAT. No usa timbres.
    #
    # GET /v1/sat_declarations/{id}/financial_statements
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-declaration-financial-statements
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def financial_statements(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_declarations/#{Core.path(id)}/financial_statements", nil, opts, kw, result: :text)
    end
  end

  # Declaraciones del SAT: fiscalisto.sat_refreshes.
  class SatRefreshesResource
    def initialize(client)
      @client = client
    end

    # Listar consultas al SAT
    #
    # Las consultas al SAT que pidió (declaraciones, opinión de cumplimiento, constancia y buzón), de la más reciente a la más antigua, con cómo van. No usa timbres.
    #
    # GET /v1/sat_refreshes
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/list-sat-refreshes
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo las de un emisor (iss_…).
    # @option params [String] :document Solo las de un documento.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sat_refreshes", params, opts, kw)
    end

    # Ver una consulta al SAT
    #
    # Cómo va una consulta al SAT (srf_…): processing mientras se consulta, completed con lo que trajo en result o failed con el motivo en error (su timbre regresó). No usa timbres.
    #
    # GET /v1/sat_refreshes/{id}
    # https://fiscalisto.com/docs/api/referencia/declaraciones-del-sat/get-sat-refresh
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sat_refreshes/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Autofactura: fiscalisto.tickets.
  class TicketsResource
    def initialize(client)
      @client = client
    end

    # Registrar un ticket
    #
    # Una venta que su comprador factura él mismo: con el código (code) y el total en el portal del emisor (url, que puede incrustar en su página con fiscalisto.js), da sus datos fiscales y la factura se timbra al momento con los timbres de su cuenta. Lo que nadie factura entra solo en la factura global del periodo. Registrar otra vez el mismo folio con el mismo total contesta el ticket que ya existe (los reintentos son seguros); con otro total, 409. Una venta de varios conceptos (el folio de un hotel) va en lines, cada uno con su clave SAT, descripción, impuestos y monto.
    #
    # POST /v1/tickets
    # https://fiscalisto.com/docs/api/referencia/autofactura/create-ticket
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…) que vendió.
    # @option params [String] :folio (obligatorio) El folio de la venta en su sistema, único por emisor: letras, números, - _ / y punto.
    # @option params [Numeric] :total Lo que se cobró, impuestos incluidos y sin propina.
    # @option params [Numeric] :tip Propina: no va en la factura.
    # @option params [String] :payment_form (obligatorio) c_FormaPago de la venta: 01 efectivo, 04 tarjeta de crédito…
    # @option params [String] :sold_at Cuándo se vendió: ISO 8601 (2026-10-02T13:45:00-06:00) o la hora de la Ciudad de México sin zona.
    # @option params [String] :product Un producto (prd_…) de su catálogo: el concepto de la factura.
    # @option params [String] :description El concepto.
    # @option params [String] :product_key c_ClaveProdServ (8 dígitos), si no usa `product`.
    # @option params [String] :unit_key c_ClaveUnidad.
    # @option params [String] :iva Tasa de IVA incluida en el total.
    # @option params [Array] :local_taxes Impuestos locales incluidos en su total, como el ISH 3.5% de hospedaje, con `product_key` (un producto lleva…
    # @option params [Numeric] :ieps IEPS incluido en su total, con `product_key` (un producto lleva el suyo): una tasa de c_TasaOCuota como 0.08…
    # @option params [String] :ieps_factor `Tasa` (por omisión) o `Cuota` (pesos por unidad).
    # @option params [Hash] :buyer Quién pagó, para reconocer la venta en Tickets.
    # @option params [String] :branch Sucursal (brn_…) donde se hizo la venta: su factura se timbra desde ahí (su código postal en LugarExpedicion)…
    # @option params [Array] :lines Una venta de varios conceptos (el folio de un hotel: noches, desayunos, lavandería), cada uno con su producto…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/tickets", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar tickets
    #
    # Del más reciente al más antiguo por fecha de venta.
    #
    # GET /v1/tickets
    # https://fiscalisto.com/docs/api/referencia/autofactura/list-tickets
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status pending, invoiced, global o canceled (también se acepta cancelled).
    # @option params [String] :sold_at[gte] Vendidos desde, incluido.
    # @option params [String] :sold_at[gt] Vendidos después de, sin incluirlo.
    # @option params [String] :sold_at[lte] Vendidos hasta, incluido.
    # @option params [String] :sold_at[lt] Vendidos antes de, sin incluirlo.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @option params [String] :sold_at_gte Igual que sold_at[gte]; se conserva por compatibilidad.
    # @option params [String] :sold_at_lte Igual que sold_at[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/tickets", params, opts, kw)
    end

    # Ver un ticket
    #
    # Un ticket de autofactura: si ya se facturó (invoice) o entró en la factura global (global_invoice).
    #
    # GET /v1/tickets/{id}
    # https://fiscalisto.com/docs/api/referencia/autofactura/get-ticket
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/tickets/#{Core.path(id)}", nil, opts, kw)
    end

    # Cancelar un ticket
    #
    # Una venta que no se hizo (devolución, error): ya no se puede facturar ni entra en la factura global. Solo mientras esté pendiente.
    #
    # DELETE /v1/tickets/{id}
    # https://fiscalisto.com/docs/api/referencia/autofactura/cancel-ticket
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/tickets/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Contabilidad: fiscalisto.accounting.
  class AccountingResource
    def initialize(client)
      @client = client
    end

    # Listar las pólizas de un mes
    #
    # Las pólizas de diario del mes, con sus cuentas y código agrupador del SAT: una por cada CFDI de ingreso o egreso vigente, emitido o recibido (los recibidos con la categoría de su gasto); una por cada pago de un complemento; una por cada recibo de nómina; una con la depreciación de los activos fijos; una por cada venta o baja de un activo, y las capturadas a mano (POST /v1/accounting/manual_entries) con las reversiones de sus provisiones. Un PUE se registra cobrado o pagado según su forma de pago. En pesos; un CFDI en otra moneda sin tipo de cambio no se registra. No incluye movimientos de banco sin CFDI.
    #
    # GET /v1/accounting/journal_entries
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-journal-entries
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [Integer] :limit Cuántas por página, de 1 a 1,000.
    # @option params [String] :starting_after El id de la última póliza de la página anterior.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def journal_entries(params = nil, opts = nil, **kw)
      @client.list_call("/v1/accounting/journal_entries", params, opts, kw)
    end

    # Ver la balanza de comprobación
    #
    # Saldo inicial, cargos, abonos y saldo final de cada cuenta en el mes. Los saldos iniciales se acumulan desde el primer CFDI, o desde los saldos iniciales capturados en la app (las de resultados, desde enero), y los resultados de cada año anterior se cierran a capital.
    #
    # GET /v1/accounting/trial_balance
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-trial-balance
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def trial_balance(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/trial_balance", params, opts, kw, send: :query)
    end

    # Ver el auxiliar de cuentas
    #
    # El libro mayor de un periodo de hasta 12 meses: el saldo inicial de cada cuenta, cada cargo y abono con su póliza (journal_entry, el mismo id de journal_entries), su CFDI y el saldo que deja, y el saldo final. Solo las cuentas que se movieron, o la que pida con account aunque no tenga movimientos; grouping_code lo limita a las de un código agrupador. Una cuenta que no está en el catálogo contesta account_missing.
    #
    # GET /v1/accounting/general_ledger
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-general-ledger
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :from_month (obligatorio) El primer mes (AAAA-MM).
    # @option params [String] :to_month El último mes (AAAA-MM), hasta 12 meses después; por omisión, from_month.
    # @option params [String] :account Solo esta cuenta, por su número en el catálogo.
    # @option params [String] :grouping_code Solo las cuentas de este código agrupador del SAT (102 trae 102.01, 102.02…), como el renglón de un estado fi…
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def general_ledger(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/general_ledger", params, opts, kw, send: :query)
    end

    # Ver los estados financieros
    #
    # El estado de resultados (del mes y del año hasta ese mes) y el balance general al cierre del mes, leídos de la misma balanza, así que siempre suman las mismas pólizas.
    #
    # GET /v1/accounting/financial_statements
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-financial-statements
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def financial_statements(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/financial_statements", params, opts, kw, send: :query)
    end

    # Ver el estado de flujos de efectivo
    #
    # El estado de flujos de efectivo (NIF B-2, método indirecto) del mes o de enero al mes: la utilidad, la depreciación y amortización que se suman, el cambio en capital de trabajo, y las actividades de inversión y de financiamiento, hasta el efectivo al cierre. Cada cuenta va a su actividad por su código agrupador; difference es 0 cuando la balanza cuadra. Como Estados financieros › Flujo de efectivo en la app.
    #
    # GET /v1/accounting/cash_flow
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-cash-flow
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :period month (solo el mes) o year_to_date (de enero al mes, por omisión).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cash_flow(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/cash_flow", params, opts, kw, send: :query)
    end

    # Ver el estado de cambios en el capital contable
    #
    # El estado de cambios en el capital contable (NIF B-4) de enero al mes: cada cuenta de capital del 1 de enero al cierre, con sus aportaciones, retiros, dividendos y traspasos, y el resultado del ejercicio. Como Estados financieros › Capital contable en la app.
    #
    # GET /v1/accounting/equity_changes
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-equity-changes
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def equity_changes(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/equity_changes", params, opts, kw, send: :query)
    end

    # Comparar los estados financieros con otro mes
    #
    # El estado de resultados (del mes y de enero al mes) y el balance general junto a los del mismo mes del año anterior (compare_to=previous_year, por omisión) o del mes anterior (previous_month), con la variación y su porcentaje por grupo de cuentas. Como Estados financieros › Comparativo en la app.
    #
    # GET /v1/accounting/comparative_statements
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-comparative-statements
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :compare_to previous_year (el mismo mes del año anterior, por omisión) o previous_month.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def comparative_statements(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/comparative_statements", params, opts, kw, send: :query)
    end

    # Ver las razones financieras
    #
    # Liquidez, prueba ácida, endeudamiento, apalancamiento, márgenes, rendimiento sobre capital y sobre activo, y días de cobro, de pago y de inventario al cierre del mes, con las cifras de que salen. Rentabilidad y rotación usan los resultados de enero al mes. Como Estados financieros › Razones financieras en la app.
    #
    # GET /v1/accounting/financial_ratios
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-financial-ratios
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def financial_ratios(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/financial_ratios", params, opts, kw, send: :query)
    end

    # Cruzar lo declarado con lo facturado
    #
    # Cada mes ya vencido del año: el IVA trasladado, acreditable y retenido y los ingresos para ISR que el emisor declaró (de GET /v1/sat_declarations, después de POST /v1/sat_declarations/refresh) contra lo que dicen sus CFDI. Hasta $2 de diferencia es redondeo (las declaraciones van en pesos enteros). Una cifra que la declaración no trae en un renglón reconocible es unreadable con declared null, nunca 0. También el IVA a favor y el régimen con que factura. Gratis: no consulta al SAT.
    #
    # GET /v1/accounting/cross_checks
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-cross-checks
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :year El ejercicio.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cross_checks(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/cross_checks", params, opts, kw, send: :query)
    end

    # Ver el IVA a favor y preparar su devolución
    #
    # El IVA a favor de cada mes de los últimos cinco años (de las declaraciones leídas con POST /v1/sat_declarations/refresh o, sin ellas, de sus CFDI, con estimated en true), cuánto se acreditó después (del saldo más antiguo primero), cuánto queda, qué está en devolución y cuándo prescribe. Con `month`, la revisión de ese mes antes de pedirlo en el SAT: declaración, cruce con CFDI, DIOT, opinión de cumplimiento, Buzón Tributario, e.firma, listas del SAT, CFDI de proveedores con hallazgos y CLABE, con el monto a pedir. No presenta nada en el SAT. Gratis.
    #
    # GET /v1/accounting/vat_refund
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-vat-refund
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month El mes del saldo a revisar (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def vat_refund(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/vat_refund", params, opts, kw, send: :query)
    end

    # Ver los CFDI de una cifra del cruce
    #
    # Los CFDI que forman lo facturado (invoiced) de una cifra del cruce de un mes, con los mismos cálculos de Impuestos: cada factura PUE o nota de crédito en su mes y cada factura PPD por lo que se pagó en el mes, con lo que aporta. La suma de cfdi más adjustment es invoiced. Sirve para ver por qué una cifra differs: con una diferencia, explanation trae los CFDI cuya combinación la suma (cancelados después, PPD sin cobro en el mes, de los días vecinos de otro mes, notas de crédito, cobros de PPD, repetidos o no declarados) y las posibles causas. Gratis: no consulta al SAT.
    #
    # GET /v1/accounting/cross_checks/cfdi
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-cross-check-cfdi
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM), cuya declaración ya venció.
    # @option params [String] :key (obligatorio) La cifra: vat_charged, vat_creditable, vat_withheld, isr_income, isr_withheld_salaries, isr_withheld_supplier…
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cross_check_cfdi(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/cross_checks/cfdi", params, opts, kw, send: :query)
    end

    # Ver el catálogo de cuentas
    #
    # Las cuentas que usan las pólizas, con su código agrupador del SAT.
    #
    # GET /v1/accounting/accounts
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-ledger-accounts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def accounts(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/accounts", params, opts, kw, send: :query)
    end

    # Agregar una cuenta al catálogo
    #
    # Una cuenta propia del emisor, para sus pólizas a mano: su número (que no se repite), su nombre y una subcuenta del código agrupador del SAT. Entra al catálogo de la contabilidad electrónica.
    #
    # POST /v1/accounting/accounts
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-ledger-account
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :number (obligatorio) Su número en el catálogo, por ejemplo 210-01-01.
    # @option params [String] :name (obligatorio) Su nombre.
    # @option params [String] :grouping_code (obligatorio) Una subcuenta del código agrupador del SAT (Anexo 24), por ejemplo 210.01.
    # @option params [String] :issuer Emisor (iss_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create_account(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/accounts", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver los estados financieros consolidados
    #
    # El estado de resultados y el balance general de varios RFC del espacio del emisor sumados cuenta por cuenta (comparten el catálogo), menos las eliminaciones del mes (POST /v1/accounting/consolidation_eliminations), con la hoja de consolidación (el saldo de cada cuenta en cada RFC, lo eliminado y el consolidado) y lo que los RFC se facturaron entre ellos sin impuestos. Los libros de cada RFC no cambian. Un emisor con un solo RFC contesta parameter_invalid en rfcs.
    #
    # GET /v1/accounting/consolidated_statements
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-consolidated-statements
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :rfcs (obligatorio) Los RFC que consolida, separados por coma (de 2 a 20).
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def consolidated_statements(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/consolidated_statements", params, opts, kw, send: :query)
    end

    # Descargar la contabilidad electrónica
    #
    # El ZIP del mes para el Buzón Tributario: el catálogo (CT) y la balanza (BN, o BC si es complementaria), cada uno en su ZIP con el nombre que espera el SAT, en el formato 1.3 del Anexo 24. Con journal_request, también las pólizas (PL), que se entregan cuando el SAT las pide. Con month AAAA-13, la balanza de comprobación ajustada al cierre del ejercicio (regla 2.8.1.6 RMF), con los saldos finales de diciembre como saldos iniciales y, con closing_entry, la póliza de cierre, y el catálogo como mes 12 (se envía con ella si no cambió en el ejercicio, fr. I); sin pólizas.
    #
    # GET /v1/accounting/electronic_accounting
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-electronic-accounting
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM), o AAAA-13 para la balanza de cierre de un ejercicio ya terminado.
    # @option params [String] :closing_entry Solo con AAAA-13: true (por omisión) incluye la póliza de cierre, que cancela ingresos, costos y gastos contr…
    # @option params [String] :type normal (BN, por omisión) o complementary (BC, con modified_on).
    # @option params [String] :modified_on complementary: el día en que se modificó (AAAA-MM-DD).
    # @option params [String] :journal_request Para incluir las pólizas: AF acto de fiscalización, FC fiscalización compulsa (con order_number), DE devoluci…
    # @option params [String] :order_number AF y FC: el número de orden (ABC1234567/26).
    # @option params [String] :procedure_number DE y CO: el número de trámite (AB123456789012).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def electronic_accounting(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/electronic_accounting", params, opts, kw, send: :query, result: :bytes)
    end

    # Descargar toda la contabilidad de un periodo
    #
    # Un ZIP para llevar los libros a otro sistema, de from_month a to_month (hasta 24 meses): el catálogo (1-catalogo, Excel con número, nombre, nivel, código agrupador y naturaleza), los saldos iniciales al primer día de from_month en deudor y acreedor (2-saldos-iniciales), las pólizas de todo el periodo para CONTPAQi Contabilidad (un TXT) y para Aspel COI (un Excel por mes), la balanza de comprobación de cada mes (una hoja por mes) y, en contabilidad-electronica, el catálogo (CT) y la balanza de cada mes (BN) en XML 1.3 del Anexo 24. LEEME.txt dice el orden en que se importa. Son los mismos libros de financial_statements y electronic_accounting.
    #
    # GET /v1/accounting/books_export
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-books-export
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :from_month (obligatorio) El primer mes (AAAA-MM), de 2015-01 al mes actual.
    # @option params [String] :to_month El último mes (AAAA-MM), hasta 24 meses después y no después del mes actual; por omisión, from_month.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def books_export(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/books_export", params, opts, kw, send: :query, result: :bytes)
    end

    # Ver la DIOT de un mes
    #
    # Lo efectivamente pagado a cada proveedor en el mes (facturas PUE y complementos de pago recibidos), con sus notas de crédito como devoluciones, por tipo de operación. Sale de las facturas recibidas que trajo de las descargas del SAT. Desde enero de 2025 (formato 2025).
    #
    # GET /v1/accounting/diot
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-diot
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def diot(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/diot", params, opts, kw, send: :query)
    end

    # Descargar la DIOT para el SAT
    #
    # El TXT de carga masiva de la DIOT 2025: 54 campos separados por |, pesos enteros. Con group_small_suppliers=true junta en una línea global a los proveedores chicos (regla 4.5.2 RMF). Un mes sin pagos a proveedores responde diot_empty: esa se presenta sin operaciones en el portal del SAT.
    #
    # GET /v1/accounting/diot/file
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-diot-file
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [Boolean] :group_small_suppliers true para agrupar proveedores de hasta $50,000 en el mes (regla 4.5.2).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def diot_file(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/diot/file", params, opts, kw, send: :query, result: :text)
    end

    # Ver los clientes con IEPS desglosado
    #
    # La relación trimestral de los clientes a los que el emisor les trasladó el IEPS por separado (artículo 19, fracción II, tercer párrafo de la Ley del IEPS): bebidas alcohólicas, bebidas energetizantes, bebidas saborizadas y alimentos de alta densidad calórica, de sus facturas de ingreso no canceladas. Público en general y extranjeros no van. Se presenta cada trimestre en el MULTI-IEPS, Anexo 1 (regla 5.2.2 de la RMF 2026), en el mes siguiente al trimestre.
    #
    # GET /v1/accounting/ieps_customers
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-ieps-customers
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :year (obligatorio) El año (AAAA), de 2015 al actual.
    # @option params [String] :quarter Solo ese trimestre (1 a 4); por omisión, los cuatro.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def ieps_customers(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/ieps_customers", params, opts, kw, send: :query)
    end

    # Descargar los clientes con IEPS desglosado
    #
    # La relación de un trimestre en CSV (UTF-8): RFC, nombre, facturas e IEPS trasladado de cada cliente, y el total; la misma que descarga la app en Impuestos.
    #
    # GET /v1/accounting/ieps_customers/file
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-ieps-customers-file
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :year (obligatorio) El año (AAAA), de 2015 al actual.
    # @option params [String] :quarter (obligatorio) El trimestre (1 a 4).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] el texto
    # @raise [Fiscalisto::Error] si la API contesta un error
    def ieps_customers_file(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/ieps_customers/file", params, opts, kw, send: :query, result: :text)
    end
  end

  # Contabilidad: fiscalisto.manual_entries.
  class ManualEntriesResource
    def initialize(client)
      @client = client
    end

    # Capturar una póliza
    #
    # Una póliza a mano: un ajuste, una provisión (reverse_next_month la revierte el día 1 del mes siguiente), una reclasificación. Cada renglón lleva una cuenta del catálogo por su número y un cargo o un abono; si no cuadran contesta entry_unbalanced, y una cuenta que no existe, account_missing. Entra a journal_entries, trial_balance, financial_statements y electronic_accounting de su mes. No puede ser antes de los saldos iniciales.
    #
    # POST /v1/accounting/manual_entries
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-manual-entry
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :date (obligatorio) La fecha de la póliza (AAAA-MM-DD).
    # @option params [String] :description (obligatorio) Su concepto.
    # @option params [String] :kind adjustment (ajuste), accrual (provisión), reclassification (reclasificación) u other.
    # @option params [String] :journal_type El tipo de póliza: journal (diario), income (ingresos) o expense (egresos).
    # @option params [Boolean] :reverse_next_month Solo con kind accrual o adjustment: la póliza se revierte sola el día 1 del mes siguiente (una provisión, par…
    # @option params [String] :uuid El UUID del CFDI con el que se relaciona, si hay uno.
    # @option params [String] :uuid_tax_id Con uuid: el RFC de la otra parte de ese CFDI.
    # @option params [String] :repeat_until Una póliza recurrente: se repite cada mes, el mismo día (el último si la fecha es el último del mes), hasta e…
    # @option params [Array] :lines (obligatorio) Sus cargos y abonos: cada renglón uno u otro; los cargos suman lo mismo que los abonos.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/manual_entries", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar las pólizas capturadas
    #
    # Las pólizas capturadas a mano del emisor, las más recientes primero.
    #
    # GET /v1/accounting/manual_entries
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-manual-entries
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántas por página, de 1 a 1,000.
    # @option params [String] :starting_after La última (mje_…) de la página anterior.
    # @option params [String] :date[gte] Con fecha de la póliza desde, incluido.
    # @option params [String] :date[gt] Con fecha de la póliza después de, sin incluirlo.
    # @option params [String] :date[lte] Con fecha de la póliza hasta, incluido.
    # @option params [String] :date[lt] Con fecha de la póliza antes de, sin incluirlo.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [String] :from Igual que date[gte]; se conserva por compatibilidad.
    # @option params [String] :to Igual que date[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/accounting/manual_entries", params, opts, kw)
    end

    # Ver una póliza capturada
    #
    # Una póliza capturada a mano.
    #
    # GET /v1/accounting/manual_entries/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-manual-entry
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/manual_entries/#{Core.path(id)}", nil, opts, kw)
    end

    # Corregir una póliza capturada
    #
    # La reemplaza con lo que manda, con las mismas reglas que al capturarla.
    #
    # POST /v1/accounting/manual_entries/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-manual-entry
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :date (obligatorio) La fecha de la póliza (AAAA-MM-DD).
    # @option params [String] :description (obligatorio) Su concepto.
    # @option params [String] :kind adjustment (ajuste), accrual (provisión), reclassification (reclasificación) u other.
    # @option params [String] :journal_type El tipo de póliza: journal (diario), income (ingresos) o expense (egresos).
    # @option params [Boolean] :reverse_next_month Solo con kind accrual o adjustment: la póliza se revierte sola el día 1 del mes siguiente (una provisión, par…
    # @option params [String] :uuid El UUID del CFDI con el que se relaciona, si hay uno.
    # @option params [String] :uuid_tax_id Con uuid: el RFC de la otra parte de ese CFDI.
    # @option params [String] :repeat_until Una póliza recurrente: se repite cada mes, el mismo día (el último si la fecha es el último del mes), hasta e…
    # @option params [Array] :lines (obligatorio) Sus cargos y abonos: cada renglón uno u otro; los cargos suman lo mismo que los abonos.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/manual_entries/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una póliza capturada
    #
    # Sale de la contabilidad con su reversión, si tenía.
    #
    # DELETE /v1/accounting/manual_entries/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-manual-entry
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/manual_entries/#{Core.path(id)}", nil, opts, kw)
    end

    # Importar pólizas de otro sistema
    #
    # Hasta 3,000 pólizas de una vez (las de CONTPAQi, COI o una hoja de cálculo), todas o ninguna: cada una con las reglas de POST /v1/accounting/manual_entries, y el error dice cuál (param entries[i].…). Entran como kind other. Una con el mismo number, fecha, tipo y total que una ya importada se salta (duplicates). DELETE /v1/accounting/manual_entry_imports/{id} quita las de una importación.
    #
    # POST /v1/accounting/manual_entry_imports
    # https://fiscalisto.com/docs/api/referencia/contabilidad/import-manual-entries
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Array] :entries (obligatorio) Las pólizas, hasta 3,000.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def import_entries(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/manual_entry_imports", params, opts, kw, send: :body, idempotent: true)
    end

    # Deshacer una importación de pólizas
    #
    # Borra todas las pólizas que trajo esa importación (mji_…). No se puede si alguna es de un mes cerrado (period_closed).
    #
    # DELETE /v1/accounting/manual_entry_imports/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/undo-manual-entries-import
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def undo_import(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/manual_entry_imports/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Contabilidad: fiscalisto.automatic_entries.
  class AutomaticEntriesResource
    def initialize(client)
      @client = client
    end

    # Ver la póliza de un CFDI
    #
    # La póliza que arma Fiscalisto para una factura, nota de crédito o recibo de nómina del emisor (por el UUID del CFDI), con su edición a mano si la tiene. Un pago no tiene una propia que se edite: se corrige con una póliza capturada.
    #
    # GET /v1/accounting/automatic_entries/{uuid}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-automatic-entry
    #
    # @param uuid [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(uuid, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/automatic_entries/#{Core.path(uuid)}", params, opts, kw, send: :query)
    end

    # Editar la póliza de un CFDI
    #
    # Sus renglones (y su concepto) en lugar de los que arma Fiscalisto, con las reglas de una póliza capturada: cuentas del catálogo y cargos que suman lo mismo que los abonos (entry_unbalanced). Se queda aunque el CFDI se vuelva a descargar, en su mes y en los saldos de los siguientes, y va a la bitácora. Un mes cerrado contesta period_closed. Los mismos renglones que la original quitan la edición.
    #
    # POST /v1/accounting/automatic_entries/{uuid}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-automatic-entry
    #
    # @param uuid [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :description Su concepto.
    # @option params [Array] :lines (obligatorio) Sus cargos y abonos en lugar de los que arma Fiscalisto: cada renglón uno u otro; los cargos suman lo mismo q…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(uuid, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/automatic_entries/#{Core.path(uuid)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Volver a la póliza original de un CFDI
    #
    # Quita la edición a mano: los libros vuelven a usar los renglones que arma Fiscalisto. Un mes cerrado contesta period_closed.
    #
    # DELETE /v1/accounting/automatic_entries/{uuid}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/revert-automatic-entry
    #
    # @param uuid [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def revert(uuid, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/automatic_entries/#{Core.path(uuid)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.prepaid_expenses.
  class PrepaidExpensesResource
    def initialize(client)
      @client = client
    end

    # Ver si una factura se amortiza
    #
    # Si una factura recibida (por su UUID) es un gasto pagado por anticipado y su calendario: una póliza de amortización al final de cada mes que cubre.
    #
    # GET /v1/accounting/prepaid_expenses/{uuid}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-prepaid-expense
    #
    # @param uuid [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(uuid, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/prepaid_expenses/#{Core.path(uuid)}", params, opts, kw, send: :query)
    end

    # Amortizar una factura pagada por anticipado
    #
    # Su póliza va a pagos anticipados (109.01, 109.05 o 109.23) y los libros la pasan a su gasto al final de cada mes que cubre (NIF C-5). Solo una factura de ingreso recibida que se registra como gasto: un activo fijo, un movimiento o una por aclarar no se amortiza, ni una cuya póliza se editó a mano. Un mes cerrado contesta period_closed. Impuestos no cambia.
    #
    # POST /v1/accounting/prepaid_expenses/{uuid}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-prepaid-expense
    #
    # @param uuid [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :kind Qué pagó: insurance (109.01 Seguros y fianzas), rent (109.05 Rentas) u other (109.23 Otros pagos anticipados).
    # @option params [Integer] :months Meses que cubre, de 1 a 120: una póliza igual cada mes.
    # @option params [String] :start_month Primer mes que cubre, AAAA-MM: el de la factura o después.
    # @option params [String] :start_date Por fechas: el primer día que cubre, AAAA-MM-DD (en el mes de la factura o después).
    # @option params [String] :end_date Por fechas: el último día que cubre, AAAA-MM-DD, incluido (una póliza del 15 de marzo al 14 de marzo del año…
    # @option params [String] :expense_account Número de la cuenta de costos o gastos (500, 600 o 700) a la que se amortiza.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(uuid, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/prepaid_expenses/#{Core.path(uuid)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Dejar de amortizar una factura
    #
    # Vuelve a registrarse como gasto del mes en la cuenta a la que se amortizaba, y sus pólizas de amortización salen de los libros. Un mes cerrado contesta period_closed.
    #
    # DELETE /v1/accounting/prepaid_expenses/{uuid}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/remove-prepaid-expense
    #
    # @param uuid [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def remove(uuid, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/prepaid_expenses/#{Core.path(uuid)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.opening_balances.
  class OpeningBalancesResource
    def initialize(client)
      @client = client
    end

    # Ver los saldos iniciales
    #
    # Los saldos de cada cuenta con los que empiezan los libros del emisor (date), como Estados financieros › Saldos iniciales en la app. Sin saldos iniciales, date es null.
    #
    # GET /v1/accounting/opening_balances
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-opening-balances
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/opening_balances", params, opts, kw, send: :query)
    end

    # Guardar los saldos iniciales
    #
    # Reemplaza los saldos iniciales: el día 1 del mes en que empiezan sus libros y el saldo deudor o acreedor de cada cuenta (por su número); las dos columnas suman lo mismo o contesta entry_unbalanced. Son los saldos finales de la balanza de su sistema anterior. Sin renglones, los borra. Nada antes de esa fecha cuenta.
    #
    # POST /v1/accounting/opening_balances
    # https://fiscalisto.com/docs/api/referencia/contabilidad/set-opening-balances
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :date (obligatorio) Cuándo empiezan sus libros (el día 1 de un mes): lo anterior no se cuenta.
    # @option params [Array] :lines (obligatorio) El saldo de cada cuenta, deudor o acreedor; las dos columnas suman lo mismo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/opening_balances", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.fixed_assets.
  class FixedAssetsResource
    def initialize(client)
      @client = client
    end

    # Listar los activos fijos
    #
    # Los activos fijos del emisor al cierre de un mes: los que llegaron con una factura recibida de uso I01 a I08 (fxc_…) y los capturados sin ella (fxa_…), con su depreciación mensual y acumulada y su valor en libros.
    #
    # GET /v1/accounting/fixed_assets
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-fixed-assets
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month El mes (AAAA-MM) a cuyo cierre van las cifras.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/fixed_assets", params, opts, kw, send: :query)
    end

    # Agregar un activo fijo sin factura
    #
    # Uno que compró antes de usar Fiscalisto o cuya factura no está aquí. Se deprecia cada mes desde el siguiente a in_use_since, en la contabilidad y en el cálculo del ISR. Su costo no entra solo a los libros: va en los saldos iniciales o en una póliza (POST /v1/accounting/manual_entries).
    #
    # POST /v1/accounting/fixed_assets
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-fixed-asset
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :description (obligatorio) Qué es.
    # @option params [String] :cfdi_use (obligatorio) El tipo de activo por su uso CFDI: I01 construcciones, I02 mobiliario, I03 transporte, I04 cómputo, I05 dados…
    # @option params [Numeric] :cost (obligatorio) El monto original sin IVA.
    # @option params [String] :acquired_on (obligatorio) La fecha de compra.
    # @option params [String] :in_use_since Desde cuándo se usa (se deprecia desde el mes siguiente); por omisión, la de compra.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/fixed_assets", params, opts, kw, send: :body, idempotent: true)
    end

    # Ver un activo fijo
    #
    # Un activo fijo, con sus cifras al cierre del mes actual.
    #
    # GET /v1/accounting/fixed_assets/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-fixed-asset
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/fixed_assets/#{Core.path(id)}", nil, opts, kw)
    end

    # Borrar un activo fijo capturado
    #
    # Solo uno capturado sin factura (fxa_…); uno con CFDI contesta asset_from_cfdi: véndalo o dele de baja.
    #
    # DELETE /v1/accounting/fixed_assets/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-fixed-asset
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/fixed_assets/#{Core.path(id)}", nil, opts, kw)
    end

    # Vender o dar de baja un activo fijo
    #
    # Deja de depreciarse el mes de date, y ese día una póliza (asset_disposal) cancela el activo y su depreciación acumulada; su valor en libros va a pérdida en venta o baja (703). El ingreso de una venta entra con la factura que emita. Uno ya dado de baja contesta asset_already_disposed.
    #
    # POST /v1/accounting/fixed_assets/{id}/dispose
    # https://fiscalisto.com/docs/api/referencia/contabilidad/dispose-fixed-asset
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :date (obligatorio) El día de la venta o la baja.
    # @option params [String] :reason sale (venta) o write_off (robo, pérdida, desecho).
    # @option params [String] :note Una nota.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def dispose(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/fixed_assets/#{Core.path(id)}/dispose", params, opts, kw, send: :body, idempotent: true)
    end

    # Deshacer la baja de un activo fijo
    #
    # El activo vuelve a depreciarse como si nunca se hubiera dado de baja.
    #
    # DELETE /v1/accounting/fixed_assets/{id}/disposal
    # https://fiscalisto.com/docs/api/referencia/contabilidad/undispose-fixed-asset
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def undispose(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/fixed_assets/#{Core.path(id)}/disposal", nil, opts, kw)
    end
  end

  # Contabilidad: fiscalisto.accounting_settings.
  class AccountingSettingsResource
    def initialize(client)
      @client = client
    end

    # Ver cómo se lleva la contabilidad
    #
    # Si cada cliente y cada proveedor tiene su propia subcuenta (party_subaccounts), como Catálogo de cuentas › Subcuentas por cliente y proveedor en la app.
    #
    # GET /v1/accounting/settings
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-accounting-settings
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/settings", params, opts, kw, send: :query)
    end

    # Cambiar cómo se lleva la contabilidad
    #
    # Con party_subaccounts en true, lo que debe cada cliente va a su subcuenta de Clientes (105-01-0001, 105-01-0002…) y lo que se le debe a cada proveedor a la suya de Proveedores (201-01-0001…), numeradas una vez en el orden en que aparecen sus CFDI y con su nombre; la balanza, los auxiliares, las pólizas y la contabilidad electrónica las usan. En false, sus saldos vuelven a Clientes y Proveedores; los números se conservan si se vuelve a activar. Aplica a toda la empresa del emisor y va a la bitácora.
    #
    # POST /v1/accounting/settings
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-accounting-settings
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Boolean] :party_subaccounts (obligatorio) true: cada cliente con su subcuenta de Clientes (105-01-0001…) y cada proveedor con la suya de Proveedores (2…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/settings", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.closed_period.
  class ClosedPeriodResource
    def initialize(client)
      @client = client
    end

    # Ver hasta qué mes está cerrada la contabilidad
    #
    # El último mes cerrado del emisor (closed_through), como Cierre del mes › Cerrar la contabilidad en la app.
    #
    # GET /v1/accounting/closed_period
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-closed-period
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/closed_period", params, opts, kw, send: :query)
    end

    # Cerrar o reabrir meses de la contabilidad
    #
    # Cierra la contabilidad hasta closed_through (y los meses anteriores), o la reabre con un mes anterior o null. En un mes cerrado, crear, corregir o borrar una póliza a mano, registrar o quitar la póliza de un movimiento de banco y dar de baja un activo contestan period_closed. Las facturas siguen llegando del SAT.
    #
    # POST /v1/accounting/closed_period
    # https://fiscalisto.com/docs/api/referencia/contabilidad/set-closed-period
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :closed_through (obligatorio) El último mes cerrado (AAAA-MM); los anteriores quedan cerrados también.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def set(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/closed_period", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.fx_revaluations.
  class FxRevaluationsResource
    def initialize(client)
      @client = client
    end

    # Ver la revaluación cambiaria de un mes
    #
    # Las facturas PPD en otra moneda que seguían pendientes al cierre del mes, lo pendiente por moneda con el tipo de cambio de cierre que sugerimos (el FIX del DOF) y la póliza de revaluación, si ya se registró. Como Cierre del mes › Revaluación cambiaria en la app.
    #
    # GET /v1/accounting/fx_revaluations/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-fx-revaluation
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(month, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/fx_revaluations/#{Core.path(month)}", params, opts, kw, send: :query)
    end

    # Registrar la revaluación cambiaria de un mes
    #
    # Registra (o reemplaza) la póliza de ajuste del último día del mes que lleva lo pendiente en otra moneda al tipo de cambio de cierre (rates): Clientes contra Utilidad o Pérdida cambiaria, y Proveedores contra Pérdida o Utilidad cambiaria. Se revierte sola el día 1 del mes siguiente, para que cada pago siga calculando su diferencia cambiaria desde el tipo de cambio de la factura. Sin facturas pendientes, o sin diferencia a esos tipos de cambio, contesta parameter_invalid en month; en un mes cerrado, period_closed.
    #
    # POST /v1/accounting/fx_revaluations/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-fx-revaluation
    #
    # @param month [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Hash] :rates (obligatorio) El tipo de cambio de cierre (pesos por unidad) de cada moneda que aparece en currencies, por ejemplo {"USD":…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(month, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/fx_revaluations/#{Core.path(month)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar la revaluación cambiaria de un mes
    #
    # Quita la póliza de revaluación del mes y su reversión. En un mes cerrado contesta period_closed.
    #
    # DELETE /v1/accounting/fx_revaluations/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-fx-revaluation
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(month, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/fx_revaluations/#{Core.path(month)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.cost_of_sales.
  class CostOfSalesResource
    def initialize(client)
      @client = client
    end

    # Ver el costo de ventas de un mes
    #
    # Las compras netas del mes según sus pólizas, el inventario en libros, lo que vale el inventario según Inventario y la póliza de costo de ventas, si ya se registró. Como Cierre del mes › Inventario y costo de ventas en la app.
    #
    # GET /v1/accounting/cost_of_sales/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-cost-of-sales
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(month, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/cost_of_sales/#{Core.path(month)}", params, opts, kw, send: :query)
    end

    # Registrar el costo de ventas de un mes
    #
    # Registra (o reemplaza) la póliza del último día del mes en el sistema de inventarios periódico: Inventario queda en ending_inventory, las compras (502) y sus devoluciones (503) se cancelan y la diferencia va a Costo de ventas (501.01): inventario inicial + compras netas − inventario final, el costo de lo vendido que se deduce (LISR arts. 25-II y 39). Sin compras ni cambio de inventario contesta parameter_invalid en month; en un mes cerrado, period_closed.
    #
    # POST /v1/accounting/cost_of_sales/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-cost-of-sales
    #
    # @param month [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Numeric] :ending_inventory (obligatorio) Lo que vale el inventario al cierre del mes en pesos (0 si no hay).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(month, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/cost_of_sales/#{Core.path(month)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar el costo de ventas de un mes
    #
    # Quita la póliza de costo de ventas del mes. En un mes cerrado contesta period_closed.
    #
    # DELETE /v1/accounting/cost_of_sales/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-cost-of-sales
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(month, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/cost_of_sales/#{Core.path(month)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.budgets.
  class BudgetsResource
    def initialize(client)
      @client = client
    end

    # Ver el presupuesto de un año contra lo real
    #
    # El presupuesto del año por cuenta de resultados y mes, y la comparación con lo real de sus pólizas: el mes y de enero a ese mes, con la variación, su porcentaje y si es favorable (deja más utilidad que lo planeado). Con cost_center, el presupuesto y lo real de ese centro de costo; sin él, de toda la empresa. Como Estados financieros › Presupuesto en la app.
    #
    # GET /v1/accounting/budgets/{year}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-budget
    #
    # @param year [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :cost_center El centro de costo (ccn_…).
    # @option params [Integer] :month El mes de la comparación, de 1 a 12.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(year, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/budgets/#{Core.path(year)}", params, opts, kw, send: :query)
    end

    # Guardar el presupuesto de un año
    #
    # Reemplaza el presupuesto del año (de toda la empresa, o del centro de costo de cost_center) con las cuentas que mande: cada una con sus 12 meses en la naturaleza de la cuenta. Solo cuentas de resultados (códigos agrupadores 4 a 7); una cuenta dos veces contesta parameter_invalid en lines. Una lista vacía borra el presupuesto.
    #
    # POST /v1/accounting/budgets/{year}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/save-budget
    #
    # @param year [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :cost_center El centro de costo (ccn_…) del presupuesto.
    # @option params [Array] :lines (obligatorio) Las cuentas del presupuesto.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def save(year, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/budgets/#{Core.path(year)}", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.inflation_adjustments.
  class InflationAdjustmentsResource
    def initialize(client)
      @client = client
    end

    # Calcular el ajuste anual por inflación
    #
    # El ajuste anual por inflación de una persona moral (artículo 44 de la Ley del ISR): la suma de los saldos al último día de cada mes de sus créditos y de sus deudas entre los meses del ejercicio, y la diferencia por el factor de ajuste anual. Deudas mayores dan un ajuste acumulable (taxable); créditos mayores, uno deducible. Cada cuenta cuenta por su código agrupador (con la razón en reason) o como la marcó con POST /v1/accounting/inflation_accounts. En el año en curso es una estimación hasta el mes actual. Como Estados financieros › Ajuste por inflación en la app.
    #
    # GET /v1/accounting/inflation_adjustments/{year}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-inflation-adjustment
    #
    # @param year [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :from_month El primer mes del ejercicio, de 1 a 12.
    # @option params [Integer] :through_month El último mes, de 1 a 12.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(year, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/inflation_adjustments/#{Core.path(year)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.inflation_accounts.
  class InflationAccountsResource
    def initialize(client)
      @client = client
    end

    # Cambiar cómo cuenta una cuenta en el ajuste por inflación
    #
    # Marca cuentas de balance como crédito (credit), deuda (debt) o ninguno (none) para el ajuste anual por inflación, por ejemplo un préstamo a un socio persona moral o una deuda de un gasto no deducible. treatment null regresa al de su código agrupador. Una cuenta de resultados contesta parameter_invalid.
    #
    # POST /v1/accounting/inflation_accounts
    # https://fiscalisto.com/docs/api/referencia/contabilidad/save-inflation-accounts
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Array] :accounts (obligatorio) Las cuentas que cambia.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def save(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/inflation_accounts", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.annual_returns.
  class AnnualReturnsResource
    def initialize(client)
      @client = client
    end

    # Calcular la declaración anual de una persona moral
    #
    # La declaración anual de una persona moral del régimen general (Título II de la Ley del ISR) desde su contabilidad: la conciliación contable-fiscal (items: partidas de los libros, de los CFDI, de la nómina, el ajuste anual por inflación, la deducción de inversiones y las capturadas), ingresos acumulables y deducciones autorizadas, utilidad o pérdida fiscal después de la PTU pagada (artículo 9), las pérdidas de ejercicios anteriores actualizadas y aplicadas (artículo 57), desde 2027 los límites de los artículos 78-A a 78-D, el resultado fiscal, el ISR del ejercicio menos pagos provisionales y retenciones (balance: positivo a cargo, negativo a favor), el coeficiente de utilidad para el año siguiente (artículo 14), la renta gravable de la PTU, la utilidad fiscal neta (artículo 77) y en tax_accounts la CUFIN y la CUCA con lo que cada dividendo o reembolso saca de ellas, el ISR del artículo 10 y el 10% a retener (artículo 140). Es un papel de trabajo para su contador, no la declaración presentada. Un emisor persona física, RESICO o no lucrativo contesta regime_not_applicable. Como Estados financieros › Declaración anual en la app.
    #
    # GET /v1/accounting/annual_returns/{year}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-annual-return
    #
    # @param year [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [Integer] :through_month El último mes, de 1 a 12, para estimar el año en curso.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(year, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/annual_returns/#{Core.path(year)}", params, opts, kw, send: :query)
    end

    # Capturar lo que los libros no dicen de la declaración anual
    #
    # Reemplaza lo capturado para la declaración anual del año: las pérdidas pendientes por ejercicio (con el mes hasta el que están actualizadas), desde 2027 las deducciones pendientes del artículo 78-B, las partidas de la conciliación (como dividendos de personas morales mexicanas, ingreso no acumulable), si está en una excepción del artículo 78-E, el primer mes del ejercicio y, en tax_accounts, la CUFIN y la CUCA (saldos iniciales, dividendos pagados o recibidos, aportaciones y reembolsos; sin tax_accounts se quedan los guardados). Mande la lista completa: lo que no mande se quita. Una pérdida de este año o posterior, un mes de actualización anterior a su ejercicio o dos del mismo ejercicio contestan parameter_invalid. Contesta la declaración recalculada.
    #
    # POST /v1/accounting/annual_returns/{year}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/save-annual-return
    #
    # @param year [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Array] :losses (obligatorio) Las pérdidas fiscales de ejercicios anteriores pendientes de aplicar (artículo 57), una por ejercicio.
    # @option params [Array] :pending_deductions Desde 2027: las deducciones que el límite del artículo 78-B dejó para los 20 ejercicios siguientes.
    # @option params [Array] :items Las partidas de la conciliación que los libros, los CFDI y la nómina no dicen.
    # @option params [Boolean] :exception_78e true si está en una de las excepciones del artículo 78-E: no le aplican los límites de los artículos 78-A a 7…
    # @option params [Integer] :from_month El primer mes del ejercicio: 1, o el mes en que empezó si fue en el año.
    # @option params [Hash] :tax_accounts La CUFIN y la CUCA (artículos 77 y 78): saldos iniciales y movimientos del año.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def save(year, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/annual_returns/#{Core.path(year)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Llevar las pérdidas que quedan al año siguiente
    #
    # Pasa a lo capturado del año siguiente las pérdidas que quedan después de este año (con la de este año, si la hubo, actualizada al último mes del ejercicio) desde 2027 las deducciones pendientes del artículo 78-B, y los saldos de la CUFIN y la CUCA al 31 de diciembre con el ISR de dividendos por acreditar; reemplaza los que tuviera. Si los pagos provisionales del año siguiente no tienen pérdidas en Impuestos, les pone su total (artículo 14, fracción II). Las demás capturas del año siguiente se quedan.
    #
    # POST /v1/accounting/annual_returns/{year}/carry_forward
    # https://fiscalisto.com/docs/api/referencia/contabilidad/carry-forward-annual-return
    #
    # @param year [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def carry_forward(year, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/annual_returns/#{Core.path(year)}/carry_forward", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.depreciation_reconciliations.
  class DepreciationReconciliationsResource
    def initialize(client)
      @client = client
    end

    # Comparar la depreciación contable con la fiscal
    #
    # La depreciación contable del año de cada activo fijo contra su deducción fiscal (artículo 34 de la Ley del ISR, actualizada con el INPC del artículo 31) y la diferencia, que es partida de la conciliación contable-fiscal de la declaración anual. Las notas de crédito sobre un activo van en su propio renglón. Como Activos fijos › Contable contra fiscal en la app.
    #
    # GET /v1/accounting/depreciation_reconciliations/{year}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-depreciation-reconciliation
    #
    # @param year [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(year, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/depreciation_reconciliations/#{Core.path(year)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.book_depreciation_rates.
  class BookDepreciationRatesResource
    def initialize(client)
      @client = client
    end

    # Fijar la tasa de depreciación contable
    #
    # Fija la tasa anual y el valor residual con que los libros deprecian un activo (fixed_asset) o todos los de un tipo (cfdi_use) desde from_month en adelante (NIF C-6); la del activo gana sobre la de su tipo. Los meses anteriores no cambian, y la deducción fiscal sigue con la tasa del artículo 34. annual_rate null quita la de ese mes. Un mes cerrado contesta parameter_invalid en from_month.
    #
    # POST /v1/accounting/book_depreciation_rates
    # https://fiscalisto.com/docs/api/referencia/contabilidad/save-book-depreciation-rate
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :fixed_asset El activo fijo (fxa_… o fxc_…) que lleva su propia tasa.
    # @option params [String] :cfdi_use El tipo de activo (uso CFDI I01–I08) cuyos activos toman la tasa.
    # @option params [String] :from_month (obligatorio) El mes, AAAA-MM y abierto, desde el que aplica.
    # @option params [Numeric] :annual_rate (obligatorio) La tasa anual de los libros (0.2 son 5 años de vida útil).
    # @option params [Numeric] :residual_rate El valor residual como fracción del monto original (NIF C-6); 0 si no se manda.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def save(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/book_depreciation_rates", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.chart_templates.
  class ChartTemplatesResource
    def initialize(client)
      @client = client
    end

    # Listar los catálogos por giro
    #
    # Los catálogos por giro (comercio, restaurante, construcción, servicios profesionales, manufactura, transporte, arrendamiento, agropecuario) con las cuentas que agregaría cada uno a su catálogo y cuáles ya tiene.
    #
    # GET /v1/accounting/chart_templates
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-chart-templates
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/chart_templates", params, opts, kw, send: :query)
    end

    # Agregar las cuentas de un giro
    #
    # Agrega a su catálogo las cuentas del giro que faltan, cada una bajo su código agrupador. Un código que ya tiene cuenta la conserva y nada se borra ni se renombra, así que se puede llamar otra vez sin duplicar.
    #
    # POST /v1/accounting/chart_templates/{id}/apply
    # https://fiscalisto.com/docs/api/referencia/contabilidad/apply-chart-template
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def apply(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/chart_templates/#{Core.path(id)}/apply", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.account_renumberings.
  class AccountRenumberingsResource
    def initialize(client)
      @client = client
    end

    # Renumerar el catálogo
    #
    # Cambia el número de todas las cuentas a la vez: con separator y widths (cada nivel rellenado con ceros) o con mapping (el número nuevo de cada una). Las pólizas, saldos iniciales y presupuestos siguen en las mismas cuentas. Si alguna no puede tomar su número (un nivel que no cabe, el de una cuenta de mayor, dos cuentas en un número) no cambia ninguna y contesta parameter_invalid; con dry_run solo dice qué cambiaría. Las subcuentas de banco conservan el suyo.
    #
    # POST /v1/accounting/account_renumberings
    # https://fiscalisto.com/docs/api/referencia/contabilidad/renumber-accounts
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :separator Lo que separa los niveles: «-» (601-48), «.» (601.48) o «» (60148).
    # @option params [Array] :widths Los dígitos de cada nivel, rellenados con ceros a la izquierda: [4, 3] hace 601-48 0601-048.
    # @option params [Array] :mapping En vez de separator y widths: el número nuevo de cada cuenta que cambia, por ejemplo los del sistema de su co…
    # @option params [Boolean] :dry_run true: dice qué cambiaría, sin cambiar nada.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/account_renumberings", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.books_log.
  class BooksLogResource
    def initialize(client)
      @client = client
    end

    # Listar la bitácora de la contabilidad
    #
    # Cada cambio a la contabilidad del RFC del emisor, del más reciente al más antiguo: pólizas a mano (también las que hacen el cierre del mes, la revaluación y los bancos), saldos iniciales, cuentas y el catálogo (que comparten los RFC del espacio), cierres y reaperturas de mes, eliminaciones de consolidación, pólizas modelo y bajas de activos. Cada uno dice quién lo hizo (un usuario, una llave de la API o un asistente) y cómo estaba antes y después. Guardar algo sin cambios no deja registro.
    #
    # GET /v1/accounting/books_log
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-books-log
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :subject Solo los cambios de una cosa: manual_journal_entry, opening_balances, account, chart_of_accounts, period_clos…
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [String] :from Igual que created[gte]; se conserva por compatibilidad.
    # @option params [String] :to Igual que created[lte]; se conserva por compatibilidad.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/accounting/books_log", params, opts, kw)
    end
  end

  # Contabilidad: fiscalisto.consolidation_eliminations.
  class ConsolidationEliminationsResource
    def initialize(client)
      @client = client
    end

    # Listar las eliminaciones de consolidación de un mes
    #
    # Las eliminaciones capturadas para el mes: lo que el consolidado resta al cierre de ese mes (ventas, saldos e inversiones entre los RFC).
    #
    # GET /v1/accounting/consolidation_eliminations
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-consolidation-eliminations
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/consolidation_eliminations", params, opts, kw, send: :query)
    end

    # Capturar una eliminación de consolidación
    #
    # Guarda una eliminación del mes entre los RFC que dice: renglones de cargo y abono que cuadran, sobre cuentas de su catálogo. Cada mes lleva sus eliminaciones completas a esa fecha (las ventas entre ellos del año hasta ese mes y los saldos entre ellos al cierre), como una hoja de consolidación. Solo cambia el consolidado, nunca los libros de un RFC.
    #
    # POST /v1/accounting/consolidation_eliminations
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-consolidation-elimination
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :month (obligatorio) El mes (AAAA-MM) a cuyo cierre se elimina.
    # @option params [String] :description (obligatorio) El concepto: «Ventas entre empresas del grupo».
    # @option params [Array] :rfcs (obligatorio) Los RFC entre los que es, del espacio del emisor: se aplica cuando todos están en el consolidado.
    # @option params [Array] :lines (obligatorio) Sus renglones: los cargos suman lo mismo que los abonos.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/consolidation_eliminations", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar una eliminación de consolidación
    #
    # La reemplaza con lo que manda.
    #
    # POST /v1/accounting/consolidation_eliminations/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-consolidation-elimination
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :month (obligatorio) El mes (AAAA-MM) a cuyo cierre se elimina.
    # @option params [String] :description (obligatorio) El concepto: «Ventas entre empresas del grupo».
    # @option params [Array] :rfcs (obligatorio) Los RFC entre los que es, del espacio del emisor: se aplica cuando todos están en el consolidado.
    # @option params [Array] :lines (obligatorio) Sus renglones: los cargos suman lo mismo que los abonos.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/consolidation_eliminations/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una eliminación de consolidación
    #
    # Solo cambia el consolidado: los libros de cada RFC siguen igual.
    #
    # DELETE /v1/accounting/consolidation_eliminations/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-consolidation-elimination
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/consolidation_eliminations/#{Core.path(id)}", nil, opts, kw)
    end
  end

  # Contabilidad: fiscalisto.entry_templates.
  class EntryTemplatesResource
    def initialize(client)
      @client = client
    end

    # Listar las pólizas modelo
    #
    # Las pólizas modelo del emisor, por nombre: las cuentas de una póliza que captura seguido con el porcentaje del total de cada renglón. Como «Usar un modelo» en Nueva póliza.
    #
    # GET /v1/accounting/entry_templates
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-entry-templates
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/entry_templates", params, opts, kw, send: :query)
    end

    # Guardar una póliza modelo
    #
    # Guarda las cuentas de una póliza bajo un nombre, cada renglón en su lado con el porcentaje del total (percentage), un importe fijo (amount) o ninguno, para escribirlo cada vez. Los porcentajes de un lado suman hasta 100. El nombre es único en el emisor.
    #
    # POST /v1/accounting/entry_templates
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-entry-template
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) El nombre del modelo, único en el emisor: «Compra con IVA al 16%».
    # @option params [String] :description (obligatorio) El concepto de las pólizas que se hacen con él.
    # @option params [String] :kind adjustment (ajuste), accrual (provisión), reclassification (reclasificación) u other.
    # @option params [String] :journal_type El tipo de póliza: journal (diario), income (ingresos) o expense (egresos).
    # @option params [Array] :lines (obligatorio) Sus renglones: la cuenta, el lado y el porcentaje del total o el importe fijo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/entry_templates", params, opts, kw, send: :body, idempotent: true)
    end

    # Cambiar una póliza modelo
    #
    # La reemplaza con lo que manda. Las pólizas que ya se hicieron con ella no cambian.
    #
    # POST /v1/accounting/entry_templates/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-entry-template
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name (obligatorio) El nombre del modelo, único en el emisor: «Compra con IVA al 16%».
    # @option params [String] :description (obligatorio) El concepto de las pólizas que se hacen con él.
    # @option params [String] :kind adjustment (ajuste), accrual (provisión), reclassification (reclasificación) u other.
    # @option params [String] :journal_type El tipo de póliza: journal (diario), income (ingresos) o expense (egresos).
    # @option params [Array] :lines (obligatorio) Sus renglones: la cuenta, el lado y el porcentaje del total o el importe fijo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/entry_templates/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una póliza modelo
    #
    # Las pólizas que ya se hicieron con ella no cambian.
    #
    # DELETE /v1/accounting/entry_templates/{id}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-entry-template
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/entry_templates/#{Core.path(id)}", nil, opts, kw)
    end

    # Calcular los renglones de una póliza modelo
    #
    # Los renglones de la póliza modelo para un total: cada porcentaje al centavo, los importes fijos como están y 0 donde no hay ninguno. El centavo del redondeo va al renglón más grande de un lado que suma 100%, para que cuadre. Mándelos como lines en POST /v1/accounting/manual_entries; aquí no se guarda nada.
    #
    # POST /v1/accounting/entry_templates/{id}/apply
    # https://fiscalisto.com/docs/api/referencia/contabilidad/apply-entry-template
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Numeric] :total (obligatorio) El total de la póliza: cada porcentaje se calcula sobre él, al centavo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def apply(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/entry_templates/#{Core.path(id)}/apply", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.cost_center_results.
  class CostCenterResultsResource
    def initialize(client)
      @client = client
    end

    # Ver el estado de resultados por centro de costo
    #
    # Lo que cada centro de costo dejó de utilidad en el mes y de enero a ese mes: sus ingresos, costo de ventas, gastos y otros, de las facturas que se le pusieron (POST /v1/cost_centers/{id}/invoices) y de los renglones de póliza a mano que lo llevan (lines[].cost_center). Lo que no tiene centro va con cost_center null; todos suman el estado de resultados de la empresa.
    #
    # GET /v1/accounting/cost_center_results/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-cost-center-results
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(month, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/cost_center_results/#{Core.path(month)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.payroll_provisions.
  class PayrollProvisionsResource
    def initialize(client)
      @client = client
    end

    # Ver las cuotas patronales de un mes
    #
    # Lo que la empresa debe al IMSS, al SAR y al Infonavit por los días del mes, calculado de sus recibos de nómina timbrados (su salario base de cotización y sus días, con faltas e incapacidades como dice la Ley del Seguro Social), el impuesto sobre nómina del mes y la póliza de provisión, si ya se registró. Como Cierre del mes › Cuotas patronales del mes en la app. Se calcula con las tasas de 2026; otro año contesta parameter_invalid en month.
    #
    # GET /v1/accounting/payroll_provisions/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-payroll-provision
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(month, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/payroll_provisions/#{Core.path(month)}", params, opts, kw, send: :query)
    end

    # Registrar las cuotas patronales de un mes
    #
    # Registra (o reemplaza) la provisión del último día del mes: Cuotas patronales al IMSS (601.26), Aportaciones patronales al Infonavit (601.27), al SAR (601.28) e Impuesto sobre nómina (601.29) contra IMSS, SAR e Infonavit por pagar (211.01 a 211.03) e Impuesto sobre nómina por pagar (213.04). Los importes que mande reemplazan los calculados; employer_risk_premium se guarda para los meses siguientes. Al pagarlos, registre el retiro del banco contra esas cuentas. Sin recibos ni importes contesta parameter_invalid en month; en un mes cerrado, period_closed.
    #
    # POST /v1/accounting/payroll_provisions/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-payroll-provision
    #
    # @param month [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Numeric] :employer_risk_premium La prima de riesgo de trabajo de su determinación anual, como fracción (0.0054355 es 0.54355%).
    # @option params [Numeric] :imss Las cuotas patronales al IMSS en pesos, si no quiere el calculado (el del SUA, por ejemplo).
    # @option params [Numeric] :sar Retiro y cesantía y vejez en pesos, si no quiere el calculado (el del SUA, por ejemplo).
    # @option params [Numeric] :infonavit La aportación al Infonavit en pesos, si no quiere el calculado (el del SUA, por ejemplo).
    # @option params [Numeric] :payroll_tax El impuesto sobre nómina en pesos, si no quiere el calculado (el del SUA, por ejemplo).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(month, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/payroll_provisions/#{Core.path(month)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar las cuotas patronales de un mes
    #
    # Quita la póliza de provisión del mes. En un mes cerrado contesta period_closed.
    #
    # DELETE /v1/accounting/payroll_provisions/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-payroll-provision
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(month, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/payroll_provisions/#{Core.path(month)}", params, opts, kw, send: :query)
    end

    # Comparar las cuotas de un mes con el SUA
    #
    # Lee la cédula de determinación de cuotas que imprimió el SUA para el mes (la mensual, del IMSS: cuota fija, excedente, prestaciones en dinero, gastos médicos de pensionados, riesgos de trabajo, invalidez y vida y guarderías) y la compara trabajador por trabajador, por su NSS, con lo que Fiscalisto calculó de los recibos timbrados: quién está solo en uno de los dos y en qué difieren los días, el salario base de cotización o las cuotas (hasta un peso es redondeo del SUA). Se calcula con la prima de riesgo de la cédula. No guarda nada: si el SUA tiene razón, mande sus importes a POST /v1/accounting/payroll_provisions/{month}. Como Cierre del mes › Cuotas patronales del mes › Comparar con el SUA en la app. Una cédula de otro mes contesta workers vacío y cedula_month con su mes.
    #
    # POST /v1/accounting/payroll_provisions/{month}/sua_comparison
    # https://fiscalisto.com/docs/api/referencia/contabilidad/compare-sua-cedula
    #
    # @param month [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :file (obligatorio) La cédula de determinación de cuotas del mes (la mensual, del IMSS) en PDF como la imprimió el SUA, en base64…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def compare_sua(month, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/payroll_provisions/#{Core.path(month)}/sua_comparison", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.tax_determinations.
  class TaxDeterminationsResource
    def initialize(client)
      @client = client
    end

    # Ver la determinación de impuestos de un mes
    #
    # El IVA cobrado y pagado del mes según sus pólizas (y el que le retuvieron sus clientes), el IVA por pagar o a favor que resulta, el pago provisional de ISR que sugiere Impuestos y la póliza de determinación, si ya se registró. Como Cierre del mes › Impuestos del mes en la app.
    #
    # GET /v1/accounting/tax_determinations/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/get-tax-determination
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(month, params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/tax_determinations/#{Core.path(month)}", params, opts, kw, send: :query)
    end

    # Registrar la determinación de impuestos de un mes
    #
    # Registra (o reemplaza) la póliza del último día del mes: IVA trasladado cobrado contra IVA acreditable pagado y el IVA retenido por clientes, la diferencia a IVA por pagar o IVA a favor, e isr a Pagos provisionales de ISR contra ISR por pagar. Al pagarlos, registre el retiro del banco contra esas cuentas (POST /v1/accounting/bank_movements/{id}/post). Sin IVA ni ISR contesta parameter_invalid en month; en un mes cerrado, period_closed.
    #
    # POST /v1/accounting/tax_determinations/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/create-tax-determination
    #
    # @param month [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [Numeric] :isr (obligatorio) El pago provisional de ISR del mes en pesos (0 si no hay).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(month, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/tax_determinations/#{Core.path(month)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar la determinación de impuestos de un mes
    #
    # Quita la póliza de determinación del mes. En un mes cerrado contesta period_closed.
    #
    # DELETE /v1/accounting/tax_determinations/{month}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/delete-tax-determination
    #
    # @param month [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(month, params = nil, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/tax_determinations/#{Core.path(month)}", params, opts, kw, send: :query)
    end
  end

  # Contabilidad: fiscalisto.ledger_bank_accounts.
  class LedgerBankAccountsResource
    def initialize(client)
      @client = client
    end

    # Listar las cuentas de banco de la contabilidad
    #
    # Las cuentas de banco del emisor que la contabilidad lleva aparte, cada una su propia subcuenta de Bancos (102-01-<últimos 4>): las de sus cuentas bancarias y las que ya tienen pólizas. Lo que la conciliación identifica en el estado de cuenta (depósitos ligados a su CFDI, retiros marcados como pago de facturas) pasa de Bancos a esa cuenta; lo que ningún estado de cuenta explica se queda en Bancos.
    #
    # GET /v1/accounting/bank_accounts
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-ledger-bank-accounts
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/bank_accounts", params, opts, kw, send: :query)
    end

    # Cambiar la moneda de una cuenta de banco
    #
    # Cambia la moneda (y el nombre) de una cuenta de banco de la contabilidad, por sus últimos 4 dígitos. Una cuenta en otra moneda se revalúa en las revaluaciones cambiarias con el saldo de su último estado de cuenta.
    #
    # POST /v1/accounting/bank_accounts/{last_four}
    # https://fiscalisto.com/docs/api/referencia/contabilidad/update-ledger-bank-account
    #
    # @param last_four [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :currency (obligatorio) La moneda de la cuenta (ISO 4217: MXN, USD…).
    # @option params [String] :name Su nombre en el catálogo.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(last_four, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/bank_accounts/#{Core.path(last_four)}", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Contabilidad: fiscalisto.bank_movements.
  class BankMovementsResource
    def initialize(client)
      @client = client
    end

    # Listar los movimientos de banco sin factura
    #
    # Los movimientos de banco de un mes que ninguna factura explica: los retiros de los estados de cuenta importados en la conciliación (comisiones, impuestos, pagos de préstamos, traspasos) y los depósitos que ahí se clasificaron como préstamo, traspaso, devolución o intereses. Cada uno con su póliza, si ya se registró, y la cuenta sugerida. Lo que pagó o cobró una factura ya está en la contabilidad por su CFDI.
    #
    # GET /v1/accounting/bank_movements
    # https://fiscalisto.com/docs/api/referencia/contabilidad/list-bank-movements
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [String] :month El mes (AAAA-MM).
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.call("GET", "/v1/accounting/bank_movements", params, opts, kw, send: :query)
    end

    # Registrar un movimiento de banco
    #
    # Le hace su póliza con fecha del movimiento: de ingresos (Bancos contra account) a un depósito, de egresos (account contra Bancos) a un retiro. Entra a la balanza, el auxiliar y la contabilidad electrónica como cualquier póliza capturada (manual_entry). Uno ya registrado contesta bank_movement_posted; un depósito sin clasificar o un retiro marcado, bank_movement_not_bookable.
    #
    # POST /v1/accounting/bank_movements/{id}/post
    # https://fiscalisto.com/docs/api/referencia/contabilidad/post-bank-movement
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :account (obligatorio) El número de la cuenta del catálogo que va contra Bancos (GET /v1/accounting/accounts).
    # @option params [String] :description El concepto de la póliza.
    # @option params [Boolean] :remember Crear (o cambiar) la regla de bank.movement que registra en esta cuenta los movimientos con el mismo texto de…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def post(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/bank_movements/#{Core.path(id)}/post", params, opts, kw, send: :body, idempotent: true)
    end

    # Quitar la póliza de un movimiento de banco
    #
    # Su póliza sale de la contabilidad y el movimiento vuelve a pending. Sin póliza contesta bank_movement_not_posted.
    #
    # DELETE /v1/accounting/bank_movements/{id}/post
    # https://fiscalisto.com/docs/api/referencia/contabilidad/unpost-bank-movement
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def unpost(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/accounting/bank_movements/#{Core.path(id)}/post", nil, opts, kw)
    end

    # Marcar un retiro
    #
    # paid_invoices: pagó facturas que ya están en la contabilidad por su CFDI; ignored: no se registra; pending: vuelve a por registrar. Solo retiros sin póliza.
    #
    # POST /v1/accounting/bank_movements/{id}/mark
    # https://fiscalisto.com/docs/api/referencia/contabilidad/mark-bank-movement
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :status (obligatorio) paid_invoices: pagó facturas que ya están en la contabilidad; ignored: no se registra; pending: vuelve a por…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def mark(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/accounting/bank_movements/#{Core.path(id)}/mark", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Tiendas en línea: fiscalisto.store_connections.
  class StoreConnectionsResource
    def initialize(client)
      @client = client
    end

    # Conectar una tienda
    #
    # Shopify: con el dominio y las llaves de la app de la tienda (Dev Dashboard, permisos read_orders y write_orders) registra los webhooks y queda active. WooCommerce: con la dirección de la tienda y una llave de su API REST de Lectura/Escritura, igual. Mercado Libre, Tiendanube y Amazon: queda pending hasta que el vendedor autorice en authorize_url (Amazon no tiene webhooks: sus pedidos se leen cada hora). Desde entonces cada pedido pagado es un ticket (folio SHOP-1001, WEB-1001, TN-1001, ML-… o AMZ-…), que su comprador factura en el portal o entra en la factura global; un pedido cancelado o reembolsado completo cancela su ticket.
    #
    # POST /v1/store_connections
    # https://fiscalisto.com/docs/api/referencia/tiendas-en-linea/create-store-connection
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…) dueño de la tienda.
    # @option params [String] :platform (obligatorio) shopify, woocommerce, mercadolibre, tiendanube, amazon, mercadopago, conekta u openpay.
    # @option params [String] :shop Shopify: el dominio de la tienda (mi-tienda.myshopify.com).
    # @option params [String] :client_id Shopify: el Client ID de la app de la tienda (Dev Dashboard).
    # @option params [String] :client_secret Shopify: el Client secret de esa app; con él se firman los webhooks.
    # @option params [String] :access_token Mercado Pago: el Access Token de producción (APP_USR-…), en Tus integraciones › su aplicación › Credenciales…
    # @option params [String] :private_key Conekta: la llave privada (key_…).
    # @option params [String] :merchant_id Openpay: el ID de comercio (m…).
    # @option params [Boolean] :sandbox Openpay: true para conectar su comercio de pruebas (sandbox).
    # @option params [String] :site WooCommerce: la dirección de la tienda (https://mitienda.com).
    # @option params [String] :consumer_key WooCommerce: la Clave de cliente (ck_…) de una llave de la API REST con permisos de Lectura/Escritura.
    # @option params [String] :consumer_secret WooCommerce: la Clave secreta de cliente (cs_…) de esa llave.
    # @option params [String] :return_url Mercado Libre, Tiendanube y Amazon: a dónde volver después de autorizar (se agregan store_connection y status…
    # @option params [Hash] :settings Cómo se vuelve ticket cada pedido.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/store_connections", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar tiendas
    #
    # Las más recientes primero, también las desconectadas.
    #
    # GET /v1/store_connections
    # https://fiscalisto.com/docs/api/referencia/tiendas-en-linea/list-store-connections
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/store_connections", params, opts, kw)
    end

    # Ver una tienda
    #
    # Una tienda conectada (Shopify, Mercado Libre o WooCommerce), su estado y lo último que importó.
    #
    # GET /v1/store_connections/{id}
    # https://fiscalisto.com/docs/api/referencia/tiendas-en-linea/get-store-connection
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/store_connections/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar cómo se vuelven tickets sus pedidos
    #
    # Cuenta para los pedidos que lleguen; los tickets ya hechos no cambian.
    #
    # POST /v1/store_connections/{id}
    # https://fiscalisto.com/docs/api/referencia/tiendas-en-linea/update-store-connection
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Hash] :settings (obligatorio) Lo que cambia; lo demás queda.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/store_connections/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Desconectar una tienda
    #
    # Sus pedidos dejan de llegar y se borran sus llaves y webhooks. Los tickets que ya hizo siguen.
    #
    # DELETE /v1/store_connections/{id}
    # https://fiscalisto.com/docs/api/referencia/tiendas-en-linea/delete-store-connection
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/store_connections/#{Core.path(id)}", nil, opts, kw)
    end

    # Traer pedidos pagados
    #
    # Los pedidos pagados desde una fecha (hasta 31 días, 200 a la vez) que no llegaron por webhook: la tienda se conectó después o estuvo caída. Un pedido que ya es ticket no se repite.
    #
    # POST /v1/store_connections/{id}/import_orders
    # https://fiscalisto.com/docs/api/referencia/tiendas-en-linea/import-store-orders
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :since Desde qué día (AAAA-MM-DD, hasta 31 días atrás).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def import_orders(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/store_connections/#{Core.path(id)}/import_orders", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Facturas recurrentes: fiscalisto.recurring_invoices.
  class RecurringInvoicesResource
    def initialize(client)
      @client = client
    end

    # Crear una factura recurrente
    #
    # Una factura que el emisor timbra solo en cada fecha (cada interval meses en day_of_month, o cada interval semanas o días), a la hora que elija, con los timbres de su cuenta, y la manda al cliente si send_email. Cada una es una factura normal (invoice.stamped, con recurring_invoice) y nunca se timbra dos veces el mismo periodo. invoice es el cuerpo de POST /v1/invoices: se revisa ahora, con las mismas reglas.
    #
    # POST /v1/recurring_invoices
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/create-recurring-invoice
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer El emisor (iss_…).
    # @option params [String] :name (obligatorio) Para reconocerla: «Renta oficina 3», «Plan Pro de ACME».
    # @option params [Hash] :schedule (obligatorio) Cada cuánto y a qué hora se timbra.
    # @option params [Hash] :invoice (obligatorio) La factura que se repite: el cuerpo de POST /v1/invoices, sin issuer, folio, date, global ni metadata.
    # @option params [Boolean] :send_email Mandar cada factura al correo del cliente (customer.email o el del catálogo).
    # @option params [String] :catch_up Si quedaron periodos sin timbrar (sin timbres, en pausa con su fecha pasada): all los timbra todos, cada uno…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/recurring_invoices", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar facturas recurrentes
    #
    # Las más recientes primero.
    #
    # GET /v1/recurring_invoices
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/list-recurring-invoices
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status active o paused.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/recurring_invoices", params, opts, kw)
    end

    # Ver una factura recurrente
    #
    # Una factura recurrente: su calendario, la próxima fecha, la última factura que timbró y, si falló, por qué en last_error.
    #
    # GET /v1/recurring_invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/get-recurring-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/recurring_invoices/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar o pausar una factura recurrente
    #
    # Solo lo que mande cambia. invoice reemplaza la factura completa desde la siguiente vez. active: false la pausa; active: true la reanuda desde hoy, sin timbrar las fechas que pasaron en pausa. schedule.start_date mueve la siguiente fecha.
    #
    # POST /v1/recurring_invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/update-recurring-invoice
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Nombre.
    # @option params [Hash] :schedule Cada cuánto y a qué hora se timbra.
    # @option params [Hash] :invoice La factura completa que se repite desde la siguiente vez (reemplaza la anterior).
    # @option params [Boolean] :send_email true para mandar el PDF y el XML por correo al timbrar, con el diseño de Fiscalisto.
    # @option params [String] :catch_up Si quedaron periodos sin timbrar: all los timbra todos, cada uno con su mes; latest solo el más reciente.
    # @option params [Boolean] :active false la pausa; true la reanuda desde hoy, sin timbrar las fechas que pasaron en pausa.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/recurring_invoices/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una factura recurrente
    #
    # Ya no timbra más; las facturas que timbró se quedan.
    #
    # DELETE /v1/recurring_invoices/{id}
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/delete-recurring-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/recurring_invoices/#{Core.path(id)}", nil, opts, kw)
    end

    # Saltar la siguiente factura
    #
    # La siguiente fecha pasa a la que sigue, sin timbrar nada.
    #
    # POST /v1/recurring_invoices/{id}/skip
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/skip-recurring-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def skip(id, opts = nil, **kw)
      @client.call("POST", "/v1/recurring_invoices/#{Core.path(id)}/skip", nil, opts, kw, idempotent: true)
    end

    # Timbrar ahora la que toca
    #
    # Timbra el periodo que ya toca (next_invoice_on es hoy o antes) sin esperar su hora. Si no toca aún, 409 recurring_not_due. Si la hora llega mientras tanto, no se timbra dos veces: es el mismo periodo.
    #
    # POST /v1/recurring_invoices/{id}/run
    # https://fiscalisto.com/docs/api/referencia/facturas-recurrentes/run-recurring-invoice
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def run(id, opts = nil, **kw)
      @client.call("POST", "/v1/recurring_invoices/#{Core.path(id)}/run", nil, opts, kw, idempotent: true)
    end
  end

  # Cotizaciones: fiscalisto.quotes.
  class QuotesResource
    def initialize(client)
      @client = client
    end

    # Crear una cotización
    #
    # Una cotización en borrador, con los conceptos y las condiciones de pago de una factura (se revisan con las mismas reglas, así que siempre se puede facturar). customer es un cliente de su catálogo, uno con sus datos fiscales (se agrega a sus clientes) o solo name y email si aún no los tiene. Se manda con POST /v1/quotes/{id}/send.
    #
    # POST /v1/quotes
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/create-quote
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :customer (obligatorio) Un cliente de su catálogo (cus_…), uno con sus datos fiscales (como en POST /v1/invoices: se agrega a sus cli…
    # @option params [Array] :items (obligatorio) Los conceptos, como en POST /v1/invoices.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :valid_until Hasta cuándo es válida (AAAA-MM-DD, hasta un año).
    # @option params [String] :terms Condiciones: tiempo de entrega, anticipo, garantía…
    # @option params [Boolean] :auto_invoice Al aceptarla, timbrar la factura sola (con los datos fiscales del cliente; si no los tiene, la página se los…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/quotes", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar cotizaciones
    #
    # Las más recientes primero, cada una en su última versión.
    #
    # GET /v1/quotes
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/list-quotes
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo las que estén en este estado.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/quotes", params, opts, kw)
    end

    # Ver una cotización
    #
    # Su última versión.
    #
    # GET /v1/quotes/{id}
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/get-quote
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/quotes/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar una cotización
    #
    # Solo lo que mande cambia. Un borrador cambia ahí mismo; una que ya se envió (también si venció, se rechazó o se retiró) se vuelve una versión nueva en borrador (mismo número, version + 1) que el cliente ve al mandarla; mientras, su liga muestra la anterior. Una aceptada o facturada ya no cambia.
    #
    # POST /v1/quotes/{id}
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/update-quote
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :customer Un cliente de su catálogo (cus_…), uno con sus datos fiscales (como en POST /v1/invoices: se agrega a sus cli…
    # @option params [Array] :items Los conceptos, como en POST /v1/invoices.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :valid_until Hasta cuándo es válida (AAAA-MM-DD, hasta un año).
    # @option params [String] :terms Condiciones: tiempo de entrega, anticipo, garantía…
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/quotes/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar una cotización
    #
    # Borra la cotización con todas sus versiones; si ya se envió, su url deja de funcionar. Una aceptada o facturada no se borra: 400 quote_not_deletable. Para cerrarla sin borrarla, POST /v1/quotes/{id}/withdraw.
    #
    # DELETE /v1/quotes/{id}
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/delete-quote
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/quotes/#{Core.path(id)}", nil, opts, kw)
    end

    # Mandar una cotización
    #
    # La manda por correo con su PDF y la liga donde el cliente la ve, la acepta, pide cambios o la rechaza. Con send_email: false solo se marca enviada y contesta url, para que usted la mande por WhatsApp o su propio correo.
    #
    # POST /v1/quotes/{id}/send
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/send-quote
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Boolean] :send_email Mandarla por correo, con su PDF y la liga (por omisión true).
    # @option params [String] :to A quién (hasta 5 correos).
    # @option params [String] :message Un mensaje en el correo.
    # @option params [Boolean] :auto_invoice Al aceptarla, timbrar la factura sola (con los datos fiscales del cliente; si no los tiene, la página se los…
    # @option params [Boolean] :remind Recordarle por correo, a los mismos destinatarios, 3 días antes de su último día si no ha respondido (una vez…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def send(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/quotes/#{Core.path(id)}/send", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar aceptada
    #
    # El cliente le dijo que sí por teléfono, en persona… Llega quote.accepted. No timbra: para eso, POST /v1/quotes/{id}/invoice.
    #
    # POST /v1/quotes/{id}/accept
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/accept-quote
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def accept(id, opts = nil, **kw)
      @client.call("POST", "/v1/quotes/#{Core.path(id)}/accept", nil, opts, kw, idempotent: true)
    end

    # Retirar una cotización
    #
    # Usted ya no la ofrece: su liga dice que se retiró y el cliente ya no la puede aceptar (status withdrawn, decided_by user). Llega quote.withdrawn. Para ofrecerla de nuevo, cámbiela con POST /v1/quotes/{id} (una versión nueva) y mándela. Una que nunca se envió se borra: 400 quote_not_sent.
    #
    # POST /v1/quotes/{id}/withdraw
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/withdraw-quote
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :note Por qué (queda en customer_comment; el cliente no la ve).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def withdraw(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/quotes/#{Core.path(id)}/withdraw", params, opts, kw, send: :body, idempotent: true)
    end

    # Marcar rechazada
    #
    # El cliente le dijo que no por teléfono, en persona… (status rejected, decided_by user; su nota en customer_comment). Llega quote.rejected. También para una vencida que ya no va a seguir.
    #
    # POST /v1/quotes/{id}/reject
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/reject-quote
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :note Por qué (queda en customer_comment; el cliente no la ve).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reject(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/quotes/#{Core.path(id)}/reject", params, opts, kw, send: :body, idempotent: true)
    end

    # Facturar una cotización
    #
    # Timbra la factura con los conceptos de la cotización y los datos fiscales del cliente, y la deja facturada (invoice). Si no estaba aceptada, la marca aceptada. Una en otra moneda va al tipo de cambio de hoy. Sin los datos fiscales del cliente, 400 quote_customer_missing; rechazada o vencida, 400 quote_not_invoiceable. Si ya se facturó, contesta esa factura.
    #
    # POST /v1/quotes/{id}/invoice
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/invoice-quote
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def invoice(id, opts = nil, **kw)
      @client.call("POST", "/v1/quotes/#{Core.path(id)}/invoice", nil, opts, kw, idempotent: true)
    end

    # Descargar el PDF
    #
    # El PDF de su última versión, con el diseño de PDF del emisor.
    #
    # GET /v1/quotes/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/cotizaciones/get-quote-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/quotes/#{Core.path(id)}/pdf", nil, opts, kw, result: :bytes)
    end
  end

  # Pedidos: fiscalisto.sales_orders.
  class SalesOrdersResource
    def initialize(client)
      @client = client
    end

    # Crear un pedido
    #
    # Lo que su cliente le pidió, con los conceptos y las condiciones de pago de una factura (se revisan con las mismas reglas, así que cada factura que sale de él timbra). customer es un cliente de su catálogo o uno con sus datos fiscales (se agrega a sus clientes). Con quote (quo_…) lo hace de una cotización. Queda en draft, o confirmado con confirm: true (llega sales_order.confirmed y se aparta lo pedido en el almacén).
    #
    # POST /v1/sales_orders
    # https://fiscalisto.com/docs/api/referencia/pedidos/create-sales-order
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :issuer Emisor (iss_…).
    # @option params [String] :quote Hacerlo de una cotización (quo_…): toma su cliente y sus conceptos, y la cotización queda aceptada.
    # @option params [String] :customer Un cliente de su catálogo (cus_…) o uno con sus datos fiscales (como en POST /v1/invoices: se agrega a sus cl…
    # @option params [Array] :items Los conceptos, como en POST /v1/invoices (hasta 200).
    # @option params [Boolean] :confirm Confirmarlo en el mismo paso (por omisión false: queda en draft).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :customer_po El número de orden de compra de su cliente (va en la nota de cada factura).
    # @option params [String] :email A dónde mandarle el pedido y sus remisiones (hasta 5 correos, separados por comas).
    # @option params [String] :expected_on Entrega estimada (AAAA-MM-DD).
    # @option params [Integer] :payment_days Días de crédito (0: de contado).
    # @option params [String] :invoice_policy Qué se factura: delivered (por omisión), lo ya entregado; ordered, todo lo pedido desde el inicio (por ejempl…
    # @option params [String] :ship_to Dónde se entrega.
    # @option params [String] :terms Condiciones del pedido.
    # @option params [String] :internal_note Nota interna (su cliente no la ve).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar pedidos
    #
    # Los más recientes primero.
    #
    # GET /v1/sales_orders
    # https://fiscalisto.com/docs/api/referencia/pedidos/list-sales-orders
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :issuer Solo los de este emisor (iss_…).
    # @option params [String] :status Solo los que estén en este estado.
    # @option params [String] :customer Solo los de este RFC.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/sales_orders", params, opts, kw)
    end

    # Ver un pedido
    #
    # Con sus entregas, sus facturas y lo que se ha pagado de ellas.
    #
    # GET /v1/sales_orders/{id}
    # https://fiscalisto.com/docs/api/referencia/pedidos/get-sales-order
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/sales_orders/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar un pedido
    #
    # Solo lo que mande cambia. Los conceptos cambian mientras no tengan entregas ni facturas; si no, 400 sales_order_invalid.
    #
    # POST /v1/sales_orders/{id}
    # https://fiscalisto.com/docs/api/referencia/pedidos/update-sales-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :customer Un cliente de su catálogo (cus_…) o uno con sus datos fiscales (como en POST /v1/invoices: se agrega a sus cl…
    # @option params [Array] :items Los conceptos, como en POST /v1/invoices (hasta 200).
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @option params [String] :currency Moneda, clave ISO 4217 de c_Moneda (MXN, USD, EUR…).
    # @option params [Numeric] :exchange_rate Tipo de cambio a pesos (TipoCambio).
    # @option params [String] :payment_form Forma de pago (FormaPago), clave de c_FormaPago: 01 efectivo, 03 transferencia, 04 tarjeta de crédito, 28 déb…
    # @option params [String] :payment_method Método de pago (MetodoPago): PUE (una sola exhibición, por omisión) o PPD (en parcialidades o diferido, se co…
    # @option params [Boolean] :paid_later Con PUE: true si aún no le pagan («Por cobrar» en la app) aunque se pagará este mes.
    # @option params [String] :use Uso del CFDI (UsoCFDI), clave de c_UsoCFDI.
    # @option params [String] :notes Observaciones que aparecen en el PDF (no van en el XML).
    # @option params [String] :customer_po El número de orden de compra de su cliente (va en la nota de cada factura).
    # @option params [String] :email A dónde mandarle el pedido y sus remisiones (hasta 5 correos, separados por comas).
    # @option params [String] :expected_on Entrega estimada (AAAA-MM-DD).
    # @option params [Integer] :payment_days Días de crédito (0: de contado).
    # @option params [String] :invoice_policy Qué se factura: delivered (por omisión), lo ya entregado; ordered, todo lo pedido desde el inicio (por ejempl…
    # @option params [String] :ship_to Dónde se entrega.
    # @option params [String] :terms Condiciones del pedido.
    # @option params [String] :internal_note Nota interna (su cliente no la ve).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un pedido
    #
    # Solo un borrador. Uno confirmado se cancela con POST /v1/sales_orders/{id}/cancel: 400 sales_order_not_deletable.
    #
    # DELETE /v1/sales_orders/{id}
    # https://fiscalisto.com/docs/api/referencia/pedidos/delete-sales-order
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/sales_orders/#{Core.path(id)}", nil, opts, kw)
    end

    # Confirmar un pedido
    #
    # Es un pedido en firme: se aparta lo pedido en el almacén y ya se puede entregar y facturar. Llega sales_order.confirmed.
    #
    # POST /v1/sales_orders/{id}/confirm
    # https://fiscalisto.com/docs/api/referencia/pedidos/confirm-sales-order
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def confirm(id, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/confirm", nil, opts, kw, idempotent: true)
    end

    # Registrar una entrega
    #
    # Lo que salió, con su remisión (REM-1, REM-2…): la mercancía sale del almacén con la entrega, no con la factura. Por omisión, todo lo que falta. Si el emisor no vende sin existencias, no sale más de lo que hay (400 sales_order_invalid). Cuando ya salió todo llega sales_order.delivered.
    #
    # POST /v1/sales_orders/{id}/deliveries
    # https://fiscalisto.com/docs/api/referencia/pedidos/create-sales-order-delivery
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :items Cuánto sale de cada concepto.
    # @option params [String] :delivered_on Por omisión, hoy.
    # @option params [String] :carrier Transporte.
    # @option params [String] :tracking Número de guía.
    # @option params [String] :note Una nota en la remisión.
    # @option params [String] :received_by Quién recibió, si ya lo sabe (si no, su cliente lo firma en url).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def deliver(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/deliveries", params, opts, kw, send: :body, idempotent: true)
    end

    # Cancelar una entrega
    #
    # La mercancía regresa al almacén y lo entregado vuelve a quedar pendiente.
    #
    # POST /v1/sales_orders/{id}/deliveries/{delivery}/cancel
    # https://fiscalisto.com/docs/api/referencia/pedidos/cancel-sales-order-delivery
    #
    # @param id [String]
    # @param delivery [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :reason Por qué (queda en el historial).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel_delivery(id, delivery, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/deliveries/#{Core.path(delivery)}/cancel", params, opts, kw, send: :body, idempotent: true)
    end

    # Facturar un pedido
    #
    # Timbra una factura con lo entregado y no facturado (o lo que diga items; con invoice_policy ordered, lo pedido), con los datos fiscales del cliente de hoy y la nota «Pedido PED-…» con su orden de compra. Se factura en varias partes: cada llamada, con su Idempotency-Key, timbra la que sigue. Si no queda nada, 400 sales_order_invalid. Cuando sus facturas se pagan llega sales_order.paid.
    #
    # POST /v1/sales_orders/{id}/invoice
    # https://fiscalisto.com/docs/api/referencia/pedidos/invoice-sales-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Array] :items Cuánto facturar de cada concepto.
    # @option params [Boolean] :include_undelivered Facturar también lo que aún no se entrega (con invoice_policy delivered).
    # @option params [Boolean] :deliver Registrar también la entrega de lo que lleva la factura al timbrarla (venta de mostrador).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def invoice(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/invoice", params, opts, kw, send: :body, idempotent: true)
    end

    # Mandar un pedido
    #
    # Por correo, con su PDF y la liga donde su cliente lo confirma (llega sales_order.customer_confirmed), firma cada entrega y abre sus facturas. Con send_email: false solo contesta url. En borrador, 400 sales_order_draft.
    #
    # POST /v1/sales_orders/{id}/send
    # https://fiscalisto.com/docs/api/referencia/pedidos/send-sales-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Boolean] :send_email Mandarlo por correo, con su PDF y url (por omisión true).
    # @option params [String] :to A quién (hasta 5 correos).
    # @option params [String] :message Qué pasó y cómo corregirlo, para una persona.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def send(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/send", params, opts, kw, send: :body, idempotent: true)
    end

    # Ya no entregar lo pendiente
    #
    # El pedido se queda con lo ya entregado (lo demás pasa a canceled en cada concepto) y se libera lo apartado.
    #
    # POST /v1/sales_orders/{id}/cancel_remaining
    # https://fiscalisto.com/docs/api/referencia/pedidos/cancel-sales-order-remaining
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel_remaining(id, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/cancel_remaining", nil, opts, kw, idempotent: true)
    end

    # Cerrar un pedido
    #
    # Lo da por terminado aunque quede algo pendiente, y libera lo apartado.
    #
    # POST /v1/sales_orders/{id}/close
    # https://fiscalisto.com/docs/api/referencia/pedidos/close-sales-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :reason Por qué (queda en el historial).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def close(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/close", params, opts, kw, send: :body, idempotent: true)
    end

    # Cancelar un pedido
    #
    # Solo sin entregas ni facturas timbradas (cancele primero las entregas, y las facturas con POST /v1/invoices/{id}/cancel). Borra sus facturas en borrador y libera lo apartado. Llega sales_order.canceled.
    #
    # POST /v1/sales_orders/{id}/cancel
    # https://fiscalisto.com/docs/api/referencia/pedidos/cancel-sales-order
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :reason Por qué (queda en el historial).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def cancel(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/cancel", params, opts, kw, send: :body, idempotent: true)
    end

    # Reabrir un pedido
    #
    # Uno cerrado o cancelado vuelve a estar abierto.
    #
    # POST /v1/sales_orders/{id}/reopen
    # https://fiscalisto.com/docs/api/referencia/pedidos/reopen-sales-order
    #
    # @param id [String]
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def reopen(id, opts = nil, **kw)
      @client.call("POST", "/v1/sales_orders/#{Core.path(id)}/reopen", nil, opts, kw, idempotent: true)
    end

    # Descargar el PDF
    #
    # El PDF del pedido, con el diseño de PDF del emisor.
    #
    # GET /v1/sales_orders/{id}/pdf
    # https://fiscalisto.com/docs/api/referencia/pedidos/get-sales-order-pdf
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries
    # @return [String] los bytes (binario)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def pdf(id, opts = nil, **kw)
      @client.call("GET", "/v1/sales_orders/#{Core.path(id)}/pdf", nil, opts, kw, result: :bytes)
    end
  end

  # Llaves de API: fiscalisto.api_keys.
  class ApiKeysResource
    def initialize(client)
      @client = client
    end

    # Crear una llave
    #
    # Una llave nueva con permisos por recurso, para dar a cada uno de sus clientes (o a cada servidor) la suya. La respuesta trae la llave completa (secret) una sola vez. Nunca tiene más que la llave que la crea: el mismo modo y entorno de prueba, en cada recurso como mucho su acceso, dentro de sus emisores y sus IP, y vence antes o al mismo tiempo. Una llave de producción solo la crea otra de producción. Hasta 30 por hora por cuenta.
    #
    # POST /v1/api_keys
    # https://fiscalisto.com/docs/api/referencia/llaves-de-api/create-api-key
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name (obligatorio) Para qué es, para usted (por ejemplo, el nombre de su cliente).
    # @option params [Hash] :permissions (obligatorio) Qué puede hacer la llave en cada recurso: `read` o `write` (escritura incluye lectura).
    # @option params [Array] :issuers Los emisores con que trabaja (sus id).
    # @option params [Array] :allowed_ips Solo funciona desde estas IP o rangos CIDR (203.0.113.7, 203.0.113.0/24, 2001:db8::/32).
    # @option params [Integer] :lifetime_hours Horas hasta que deja de funcionar (1 hora a 3 años); null: no vence.
    # @option params [String] :expires_at En vez de lifetime_hours: el momento en que deja de funcionar (ISO 8601), entre 1 hora y 3 años después.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/api_keys", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar llaves
    #
    # Las llaves vigentes del modo que la llave puede manejar (las que no tienen más que ella), la más nueva primero. Sin el secreto. Hasta 50 por modo.
    #
    # GET /v1/api_keys
    # https://fiscalisto.com/docs/api/referencia/llaves-de-api/list-api-keys
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/api_keys", params, opts, kw)
    end

    # Ver una llave
    #
    # Sus permisos, emisores, IP, vencimiento y último uso. El secreto solo viene al crearla o cambiarla.
    #
    # GET /v1/api_keys/{id}
    # https://fiscalisto.com/docs/api/referencia/llaves-de-api/get-api-key
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/api_keys/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar una llave
    #
    # Cambia su nombre, sus permisos, sus emisores o sus IP, con el mismo secreto. Solo cambia lo que mande, con los mismos límites que al crearla. Su vencimiento no se cambia.
    #
    # POST /v1/api_keys/{id}
    # https://fiscalisto.com/docs/api/referencia/llaves-de-api/update-api-key
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :name Nombre.
    # @option params [Hash] :permissions Qué puede hacer la llave en cada recurso: `read` o `write` (escritura incluye lectura).
    # @option params [Array] :issuers Los emisores con que trabaja (sus id).
    # @option params [Array] :allowed_ips Solo funciona desde estas IP o rangos CIDR (203.0.113.7, 203.0.113.0/24, 2001:db8::/32).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/api_keys/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Revocar una llave
    #
    # Deja de funcionar en ese momento. No se puede deshacer.
    #
    # DELETE /v1/api_keys/{id}
    # https://fiscalisto.com/docs/api/referencia/llaves-de-api/revoke-api-key
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def revoke(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/api_keys/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar una llave
    #
    # Una llave nueva con el mismo nombre, permisos, emisores, IP y duración, que la respuesta trae una sola vez. La anterior sigue funcionando el tiempo que elija (expires_in), 24 horas por omisión, para que la cambie sin cortar el servicio. Si se filtró, mande expires_in: 0.
    #
    # POST /v1/api_keys/{id}/roll
    # https://fiscalisto.com/docs/api/referencia/llaves-de-api/roll-api-key
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Integer] :expires_in Segundos que la llave anterior sigue funcionando (0: deja de funcionar ya; hasta 7 días).
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def roll(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/api_keys/#{Core.path(id)}/roll", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Webhooks: fiscalisto.webhook_endpoints.
  class WebhookEndpointsResource
    def initialize(client)
      @client = client
    end

    # Crear un webhook
    #
    # La respuesta trae el secreto de firma (secret) una sola vez.
    #
    # POST /v1/webhook_endpoints
    # https://fiscalisto.com/docs/api/referencia/webhooks/create-webhook-endpoint
    #
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :url (obligatorio) Dirección https de su servidor que recibe los avisos.
    # @option params [Array] :events Eventos que quiere recibir, o ["*"] para todos (por omisión).
    # @option params [String] :description Para qué es, para usted (no se manda en los eventos).
    # @option params [String] :api_version La versión de la API en que llegan sus eventos (por ejemplo 2026-10-24); null o sin mandar: la de la cuenta.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def create(params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/webhook_endpoints", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar webhooks
    #
    # Los webhooks del modo de la llave. Hasta 16 por modo.
    #
    # GET /v1/webhook_endpoints
    # https://fiscalisto.com/docs/api/referencia/webhooks/list-webhook-endpoints
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @option params [Hash] :metadata Solo los que tienen este valor en esta llave de su metadata: metadata[pedido]=A-1042.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/webhook_endpoints", params, opts, kw)
    end

    # Ver un webhook
    #
    # Un webhook: su dirección, los eventos que recibe y si sus entregas fallan. El secreto solo viene al crearlo.
    #
    # GET /v1/webhook_endpoints/{id}
    # https://fiscalisto.com/docs/api/referencia/webhooks/get-webhook-endpoint
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/webhook_endpoints/#{Core.path(id)}", nil, opts, kw)
    end

    # Actualizar un webhook
    #
    # Cambia su dirección, sus eventos, su descripción o su versión de la API; con disabled: false vuelve a encender uno que se apagó.
    #
    # POST /v1/webhook_endpoints/{id}
    # https://fiscalisto.com/docs/api/referencia/webhooks/update-webhook-endpoint
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :url Dirección https de su servidor que recibe los avisos.
    # @option params [Array] :events Eventos que quiere recibir, o ["*"] para todos (por omisión).
    # @option params [String] :description Para qué es, para usted (no se manda en los eventos).
    # @option params [Boolean] :disabled true para apagarlo sin borrarlo.
    # @option params [String] :api_version La versión de la API en que llegan sus eventos (por ejemplo 2026-10-24); null o sin mandar: la de la cuenta.
    # @option params [Hash] :metadata Sus propios datos: hasta 50 llaves de 40 caracteres con valores de texto de hasta 500.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def update(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/webhook_endpoints/#{Core.path(id)}", params, opts, kw, send: :body, idempotent: true)
    end

    # Borrar un webhook
    #
    # Deja de mandar eventos a esa dirección. Los eventos siguen en GET /v1/events.
    #
    # DELETE /v1/webhook_endpoints/{id}
    # https://fiscalisto.com/docs/api/referencia/webhooks/delete-webhook-endpoint
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def delete(id, opts = nil, **kw)
      @client.call("DELETE", "/v1/webhook_endpoints/#{Core.path(id)}", nil, opts, kw)
    end

    # Cambiar el secreto
    #
    # Un secreto nuevo, que la respuesta trae una sola vez. El anterior sigue firmando (una segunda firma en webhook-signature) el tiempo que elija, 24 horas por omisión, para que cambie su servidor sin rechazar eventos. Si se filtró, mande previous_secret_expires_in: 0.
    #
    # POST /v1/webhook_endpoints/{id}/roll_secret
    # https://fiscalisto.com/docs/api/referencia/webhooks/roll-webhook-secret
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [Integer] :previous_secret_expires_in Segundos que el secreto anterior sigue firmando, de 0 (deja de firmar ya: úselo si se filtró) a 86400.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def roll_secret(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/webhook_endpoints/#{Core.path(id)}/roll_secret", params, opts, kw, send: :body, idempotent: true)
    end

    # Mandar un evento de prueba
    #
    # Manda ahora, una sola vez y sin reintentos, un evento del tipo que elija con un objeto de ejemplo (sus id no existen), firmado como los reales, aunque el webhook no escuche ese tipo. La respuesta trae lo que contestó su servidor. El evento no sale en GET /v1/events, pero sí en las entregas del webhook.
    #
    # POST /v1/webhook_endpoints/{id}/test
    # https://fiscalisto.com/docs/api/referencia/webhooks/test-webhook-endpoint
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :type El evento a mandar.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def test(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/webhook_endpoints/#{Core.path(id)}/test", params, opts, kw, send: :body, idempotent: true)
    end

    # Listar entregas
    #
    # Qué pasó con cada evento en este webhook, el más reciente primero: una fila por evento con su último intento, cuántos lleva y cuándo va el siguiente reintento. Con succeeded=false ve los que su servidor no recibió, para reenviarlos con POST /v1/events/{id}/resend.
    #
    # GET /v1/webhook_endpoints/{id}/deliveries
    # https://fiscalisto.com/docs/api/referencia/webhooks/list-webhook-deliveries
    #
    # @param id [String]
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [Boolean] :succeeded false: solo los que fallaron en su último intento.
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list_deliveries(id, params = nil, opts = nil, **kw)
      @client.list_call("/v1/webhook_endpoints/#{Core.path(id)}/deliveries", params, opts, kw)
    end

    # Recuperar eventos fallidos
    #
    # Después de que su servidor estuvo caído: le manda otra vez, ahora, todos los eventos desde since que este webhook escucha y no recibió (los que fallaron todos sus intentos y los que pasaron mientras estuvo apagado), del más antiguo al más reciente. Hasta 1,000 por llamada; si quedan más, next_since dice desde dónde volver a llamar. Cada uno es un intento aparte, firmado con su webhook-id de siempre, para que su servidor descarte los que ya tenía. El webhook tiene que estar encendido.
    #
    # POST /v1/webhook_endpoints/{id}/recover
    # https://fiscalisto.com/docs/api/referencia/webhooks/recover-webhook-endpoint
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :since (obligatorio) Desde cuándo (ISO 8601, de los últimos 30 días): por ejemplo, cuando empezó a fallar su servidor (failing_sin…
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def recover(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/webhook_endpoints/#{Core.path(id)}/recover", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Eventos: fiscalisto.events.
  class EventsResource
    def initialize(client)
      @client = client
    end

    # Listar eventos
    #
    # Los de los últimos 30 días, los más recientes primero. Para leer hacia adelante sin perder ninguno (lo que llegó después del último que procesó), mande ending_before con ese evento y repita con el primero de data mientras has_more sea true.
    #
    # GET /v1/events
    # https://fiscalisto.com/docs/api/referencia/eventos/list-events
    #
    # @param params [Hash, nil] los parámetros de la dirección (también como palabras clave)
    # @option params [Integer] :limit Cuántos por página, de 1 a 100.
    # @option params [String] :starting_after El id del último de la página anterior, para la siguiente.
    # @option params [String] :ending_before Un evento (evt_…): contesta los limit que llegaron justo después de él, los más recientes primero; has_more d…
    # @option params [String] :type Solo de este tipo (invoice.stamped), o todos los de un recurso con un comodín (invoice.*).
    # @option params [String] :object Solo los de este objeto (inv_…, ret_…, bat_…).
    # @option params [Boolean] :delivery_success false: los que algún webhook no recibió (su último intento falló).
    # @option params [String] :created[gte] Creados desde, incluido.
    # @option params [String] :created[gt] Creados después de, sin incluirlo.
    # @option params [String] :created[lte] Creados hasta, incluido.
    # @option params [String] :created[lt] Creados antes de, sin incluirlo.
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [ListObject] que se recorre sola (each, map, first(50)…)
    # @raise [Fiscalisto::Error] si la API contesta un error
    def list(params = nil, opts = nil, **kw)
      @client.list_call("/v1/events", params, opts, kw)
    end

    # Ver un evento
    #
    # Un evento de los últimos 30 días, con el objeto como estaba cuando pasó.
    #
    # GET /v1/events/{id}
    # https://fiscalisto.com/docs/api/referencia/eventos/get-event
    #
    # @param id [String]
    # @param opts [Hash, nil] timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def get(id, opts = nil, **kw)
      @client.call("GET", "/v1/events/#{Core.path(id)}", nil, opts, kw)
    end

    # Reenviar un evento
    #
    # Manda otra vez, ahora, un evento de los últimos 30 días: a un webhook (endpoint) o a todos los encendidos que escuchan ese tipo. Es un intento aparte, firmado con el mismo webhook-id: no cambia los reintentos automáticos, y si llega, ya no se reintenta. Úselo después de arreglar su servidor, con GET /v1/events?delivery_success=false.
    #
    # POST /v1/events/{id}/resend
    # https://fiscalisto.com/docs/api/referencia/eventos/resend-event
    #
    # @param id [String]
    # @param params [Hash, nil] el cuerpo (también como palabras clave)
    # @option params [String] :endpoint El webhook (whe_…) al que mandarlo otra vez.
    # @param opts [Hash, nil] idempotency_key, timeout, max_retries, expand
    # @return [FiscalistoObject]
    # @raise [Fiscalisto::Error] si la API contesta un error
    def resend(id, params = nil, opts = nil, **kw)
      @client.call("POST", "/v1/events/#{Core.path(id)}/resend", params, opts, kw, send: :body, idempotent: true)
    end
  end

  # Cada recurso de la API como método del cliente: fiscalisto.invoices, fiscalisto.customers…
  module Resources
    # Cuenta.
    def account
      @account ||= AccountResource.new(self)
    end

    # Cuenta.
    def test_data
      @test_data ||= TestDataResource.new(self)
    end

    # Entornos de prueba.
    def sandboxes
      @sandboxes ||= SandboxesResource.new(self)
    end

    # Entornos de prueba.
    def test_clocks
      @test_clocks ||= TestClocksResource.new(self)
    end

    # Cuenta.
    def balance
      @balance ||= BalanceResource.new(self)
    end

    # Emisores.
    def issuers
      @issuers ||= IssuersResource.new(self)
    end

    # Emisores.
    def schedule_settings
      @schedule_settings ||= ScheduleSettingsResource.new(self)
    end

    # Emisores.
    def setting_changes
      @setting_changes ||= SettingChangesResource.new(self)
    end

    # Facturas.
    def invoices
      @invoices ||= InvoicesResource.new(self)
    end

    # Cuentas por cobrar.
    def receivables
      @receivables ||= ReceivablesResource.new(self)
    end

    # Cuentas por cobrar.
    def customers
      @customers ||= CustomersResource.new(self)
    end

    # Flujo de efectivo.
    def cash_forecast
      @cash_forecast ||= CashForecastResource.new(self)
    end

    # Conciliación bancaria.
    def bank_transactions
      @bank_transactions ||= BankTransactionsResource.new(self)
    end

    # Tickets de compra.
    def purchase_receipts
      @purchase_receipts ||= PurchaseReceiptsResource.new(self)
    end

    # Pagos y notas de crédito.
    def payments
      @payments ||= PaymentsResource.new(self)
    end

    # Pagos y notas de crédito.
    def credit_notes
      @credit_notes ||= CreditNotesResource.new(self)
    end

    # Anticipos.
    def advances
      @advances ||= AdvancesResource.new(self)
    end

    # Retenciones.
    def retentions
      @retentions ||= RetentionsResource.new(self)
    end

    # Nómina.
    def employees
      @employees ||= EmployeesResource.new(self)
    end

    # Nómina.
    def employee_notice_settings
      @employee_notice_settings ||= EmployeeNoticeSettingsResource.new(self)
    end

    # Nómina.
    def vacation_requests
      @vacation_requests ||= VacationRequestsResource.new(self)
    end

    # Nómina.
    def payroll_receipts
      @payroll_receipts ||= PayrollReceiptsResource.new(self)
    end

    # Nómina.
    def payroll_batches
      @payroll_batches ||= PayrollBatchesResource.new(self)
    end

    # Nómina.
    def payroll_approvals
      @payroll_approvals ||= PayrollApprovalsResource.new(self)
    end

    # Nómina.
    def payroll_bank_files
      @payroll_bank_files ||= PayrollBankFilesResource.new(self)
    end

    # Nómina.
    def payroll_payouts
      @payroll_payouts ||= PayrollPayoutsResource.new(self)
    end

    # Nómina.
    def imss_movements
      @imss_movements ||= ImssMovementsResource.new(self)
    end

    # Nómina.
    def imss_files
      @imss_files ||= ImssFilesResource.new(self)
    end

    # Nómina.
    def employee_deductions
      @employee_deductions ||= EmployeeDeductionsResource.new(self)
    end

    # Nómina.
    def variable_salaries
      @variable_salaries ||= VariableSalariesResource.new(self)
    end

    # Nómina.
    def annual_adjustments
      @annual_adjustments ||= AnnualAdjustmentsResource.new(self)
    end

    # Nómina.
    def payroll_taxes
      @payroll_taxes ||= PayrollTaxesResource.new(self)
    end

    # Nómina.
    def payroll_reports
      @payroll_reports ||= PayrollReportsResource.new(self)
    end

    # Nómina.
    def payroll_calendar
      @payroll_calendar ||= PayrollCalendarResource.new(self)
    end

    # Nómina.
    def repse_contracts
      @repse_contracts ||= RepseContractsResource.new(self)
    end

    # Nómina.
    def repse_profile
      @repse_profile ||= RepseProfileResource.new(self)
    end

    # Nómina.
    def repse_returns
      @repse_returns ||= RepseReturnsResource.new(self)
    end

    # Nómina.
    def payroll_org_chart
      @payroll_org_chart ||= PayrollOrgChartResource.new(self)
    end

    # Nómina.
    def hiring
      @hiring ||= HiringResource.new(self)
    end

    # Nómina.
    def candidates
      @candidates ||= CandidatesResource.new(self)
    end

    # Nómina.
    def training
      @training ||= TrainingResource.new(self)
    end

    # Nómina.
    def training_courses
      @training_courses ||= TrainingCoursesResource.new(self)
    end

    # Nómina.
    def climate
      @climate ||= ClimateResource.new(self)
    end

    # Nómina.
    def climate_surveys
      @climate_surveys ||= ClimateSurveysResource.new(self)
    end

    # Nómina.
    def climate_actions
      @climate_actions ||= ClimateActionsResource.new(self)
    end

    # Nómina.
    def climate_complaints
      @climate_complaints ||= ClimateComplaintsResource.new(self)
    end

    # Nómina.
    def review_cycles
      @review_cycles ||= ReviewCyclesResource.new(self)
    end

    # Nómina.
    def review_objectives
      @review_objectives ||= ReviewObjectivesResource.new(self)
    end

    # Lotes.
    def invoice_batches
      @invoice_batches ||= InvoiceBatchesResource.new(self)
    end

    # Clientes.
    def tax_ids
      @tax_ids ||= TaxIdsResource.new(self)
    end

    # Sucursales.
    def branches
      @branches ||= BranchesResource.new(self)
    end

    # Reglas.
    def rules
      @rules ||= RulesResource.new(self)
    end

    # Reglas.
    def supplier_groups
      @supplier_groups ||= SupplierGroupsResource.new(self)
    end

    # Hallazgos.
    def findings
      @findings ||= FindingsResource.new(self)
    end

    # Centros de costo.
    def cost_centers
      @cost_centers ||= CostCentersResource.new(self)
    end

    # Etiquetas.
    def tags
      @tags ||= TagsResource.new(self)
    end

    # Listas de precios.
    def price_lists
      @price_lists ||= PriceListsResource.new(self)
    end

    # Listas de precios.
    def customer_groups
      @customer_groups ||= CustomerGroupsResource.new(self)
    end

    # Listas de precios.
    def prices
      @prices ||= PricesResource.new(self)
    end

    # Asistencia.
    def attendance
      @attendance ||= AttendanceResource.new(self)
    end

    # Viáticos y gastos.
    def expense_people
      @expense_people ||= ExpensePeopleResource.new(self)
    end

    # Viáticos y gastos.
    def expense_reports
      @expense_reports ||= ExpenseReportsResource.new(self)
    end

    # Viáticos y gastos.
    def expense_policy
      @expense_policy ||= ExpensePolicyResource.new(self)
    end

    # Clientes.
    def customer_data_requests
      @customer_data_requests ||= CustomerDataRequestsResource.new(self)
    end

    # Productos.
    def products
      @products ||= ProductsResource.new(self)
    end

    # Cumplimiento SAT.
    def sat_mailbox_messages
      @sat_mailbox_messages ||= SatMailboxMessagesResource.new(self)
    end

    # Cumplimiento SAT.
    def sat_findings
      @sat_findings ||= SatFindingsResource.new(self)
    end

    # Cumplimiento SAT.
    def sat_finding_counterparties
      @sat_finding_counterparties ||= SatFindingCounterpartiesResource.new(self)
    end

    # Cumplimiento SAT.
    def company_report
      @company_report ||= CompanyReportResource.new(self)
    end

    # Cumplimiento SAT.
    def materiality_suppliers
      @materiality_suppliers ||= MaterialitySuppliersResource.new(self)
    end

    # Cumplimiento SAT.
    def materiality_invoices
      @materiality_invoices ||= MaterialityInvoicesResource.new(self)
    end

    # Cumplimiento SAT.
    def sat_reviews
      @sat_reviews ||= SatReviewsResource.new(self)
    end

    # Cumplimiento SAT.
    def sat_risk_check
      @sat_risk_check ||= SatRiskCheckResource.new(self)
    end

    # Cumplimiento SAT.
    def tax_discrepancy
      @tax_discrepancy ||= TaxDiscrepancyResource.new(self)
    end

    # Inventario.
    def warehouses
      @warehouses ||= WarehousesResource.new(self)
    end

    # Inventario.
    def stock_movements
      @stock_movements ||= StockMovementsResource.new(self)
    end

    # Inventario.
    def stock_adjustments
      @stock_adjustments ||= StockAdjustmentsResource.new(self)
    end

    # Inventario.
    def production_orders
      @production_orders ||= ProductionOrdersResource.new(self)
    end

    # Catálogos del SAT.
    def sat_catalogs
      @sat_catalogs ||= SatCatalogsResource.new(self)
    end

    # Listas del SAT.
    def sat_lists
      @sat_lists ||= SatListsResource.new(self)
    end

    # Verificar comprobantes.
    def cfdi_verifications
      @cfdi_verifications ||= CfdiVerificationsResource.new(self)
    end

    # Equipo.
    def members
      @members ||= MembersResource.new(self)
    end

    # Equipo.
    def invitations
      @invitations ||= InvitationsResource.new(self)
    end

    # Equipo.
    def roles
      @roles ||= RolesResource.new(self)
    end

    # Equipo.
    def permissions
      @permissions ||= PermissionsResource.new(self)
    end

    # Exportaciones.
    def exports
      @exports ||= ExportsResource.new(self)
    end

    # Descargas del SAT.
    def sat_downloads
      @sat_downloads ||= SatDownloadsResource.new(self)
    end

    # Descargas del SAT.
    def sat_invoices
      @sat_invoices ||= SatInvoicesResource.new(self)
    end

    # Descargas del SAT.
    def sat_retentions
      @sat_retentions ||= SatRetentionsResource.new(self)
    end

    # Portal de proveedores.
    def portal_suppliers
      @portal_suppliers ||= PortalSuppliersResource.new(self)
    end

    # Portal de proveedores.
    def supplier_invoices
      @supplier_invoices ||= SupplierInvoicesResource.new(self)
    end

    # Pagos a proveedores.
    def payable_invoices
      @payable_invoices ||= PayableInvoicesResource.new(self)
    end

    # Pagos a proveedores.
    def payouts
      @payouts ||= PayoutsResource.new(self)
    end

    # Pagos a proveedores.
    def payee_accounts
      @payee_accounts ||= PayeeAccountsResource.new(self)
    end

    # Pagos a proveedores.
    def payout_mandates
      @payout_mandates ||= PayoutMandatesResource.new(self)
    end

    # Declaraciones del SAT.
    def sat_declarations
      @sat_declarations ||= SatDeclarationsResource.new(self)
    end

    # Declaraciones del SAT.
    def sat_refreshes
      @sat_refreshes ||= SatRefreshesResource.new(self)
    end

    # Autofactura.
    def tickets
      @tickets ||= TicketsResource.new(self)
    end

    # Contabilidad.
    def accounting
      @accounting ||= AccountingResource.new(self)
    end

    # Contabilidad.
    def manual_entries
      @manual_entries ||= ManualEntriesResource.new(self)
    end

    # Contabilidad.
    def automatic_entries
      @automatic_entries ||= AutomaticEntriesResource.new(self)
    end

    # Contabilidad.
    def prepaid_expenses
      @prepaid_expenses ||= PrepaidExpensesResource.new(self)
    end

    # Contabilidad.
    def opening_balances
      @opening_balances ||= OpeningBalancesResource.new(self)
    end

    # Contabilidad.
    def fixed_assets
      @fixed_assets ||= FixedAssetsResource.new(self)
    end

    # Contabilidad.
    def accounting_settings
      @accounting_settings ||= AccountingSettingsResource.new(self)
    end

    # Contabilidad.
    def closed_period
      @closed_period ||= ClosedPeriodResource.new(self)
    end

    # Contabilidad.
    def fx_revaluations
      @fx_revaluations ||= FxRevaluationsResource.new(self)
    end

    # Contabilidad.
    def cost_of_sales
      @cost_of_sales ||= CostOfSalesResource.new(self)
    end

    # Contabilidad.
    def budgets
      @budgets ||= BudgetsResource.new(self)
    end

    # Contabilidad.
    def inflation_adjustments
      @inflation_adjustments ||= InflationAdjustmentsResource.new(self)
    end

    # Contabilidad.
    def inflation_accounts
      @inflation_accounts ||= InflationAccountsResource.new(self)
    end

    # Contabilidad.
    def annual_returns
      @annual_returns ||= AnnualReturnsResource.new(self)
    end

    # Contabilidad.
    def depreciation_reconciliations
      @depreciation_reconciliations ||= DepreciationReconciliationsResource.new(self)
    end

    # Contabilidad.
    def book_depreciation_rates
      @book_depreciation_rates ||= BookDepreciationRatesResource.new(self)
    end

    # Contabilidad.
    def chart_templates
      @chart_templates ||= ChartTemplatesResource.new(self)
    end

    # Contabilidad.
    def account_renumberings
      @account_renumberings ||= AccountRenumberingsResource.new(self)
    end

    # Contabilidad.
    def books_log
      @books_log ||= BooksLogResource.new(self)
    end

    # Contabilidad.
    def consolidation_eliminations
      @consolidation_eliminations ||= ConsolidationEliminationsResource.new(self)
    end

    # Contabilidad.
    def entry_templates
      @entry_templates ||= EntryTemplatesResource.new(self)
    end

    # Contabilidad.
    def cost_center_results
      @cost_center_results ||= CostCenterResultsResource.new(self)
    end

    # Contabilidad.
    def payroll_provisions
      @payroll_provisions ||= PayrollProvisionsResource.new(self)
    end

    # Contabilidad.
    def tax_determinations
      @tax_determinations ||= TaxDeterminationsResource.new(self)
    end

    # Contabilidad.
    def ledger_bank_accounts
      @ledger_bank_accounts ||= LedgerBankAccountsResource.new(self)
    end

    # Contabilidad.
    def bank_movements
      @bank_movements ||= BankMovementsResource.new(self)
    end

    # Tiendas en línea.
    def store_connections
      @store_connections ||= StoreConnectionsResource.new(self)
    end

    # Facturas recurrentes.
    def recurring_invoices
      @recurring_invoices ||= RecurringInvoicesResource.new(self)
    end

    # Cotizaciones.
    def quotes
      @quotes ||= QuotesResource.new(self)
    end

    # Pedidos.
    def sales_orders
      @sales_orders ||= SalesOrdersResource.new(self)
    end

    # Llaves de API.
    def api_keys
      @api_keys ||= ApiKeysResource.new(self)
    end

    # Webhooks.
    def webhook_endpoints
      @webhook_endpoints ||= WebhookEndpointsResource.new(self)
    end

    # Eventos.
    def events
      @events ||= EventsResource.new(self)
    end
  end
end
