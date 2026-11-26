# fiscalisto

El SDK de la [API de facturación de Fiscalisto](https://fiscalisto.com/docs/api): timbre CFDI 4.0 (facturas, pagos, notas de crédito, nómina, retenciones y lotes) desde Ruby.

- `Idempotency-Key` automática en cada `POST` que timbra o crea: un reintento nunca timbra, crea ni manda nada dos veces.
- Reintentos solo de lo que es seguro repetir, con espera creciente y respetando `Retry-After`.
- Errores con su clase (`Fiscalisto::InvoiceError`, `Fiscalisto::RateLimitError`…), su `code`, `param`, `request_id` y `request_log_url`.
- Listas que se recorren solas con `each` (y `map`, `select`, `first(50)`…).
- `expand` para traer el objeto en lugar de su id.
- Webhooks verificados en una línea.
- Sin dependencias: Ruby 3.1 o más reciente.

```bash
gem install fiscalisto
```

```ruby
require "fiscalisto"

fiscalisto = Fiscalisto::Client.new # la llave viene de FISCALISTO_API_KEY

invoice = fiscalisto.invoices.create(
  {
    customer: { tax_id: "ICV060329BY0", legal_name: "INMOBILIARIA CVA", tax_system: "601", zip: "33826" },
    payment_form: "03",
    items: [{ description: "Mensualidad", product_key: "86121700", quantity: 2, unit_price: 2500 }]
  },
  idempotency_key: "pedido-A-1042"
)

puts invoice.uuid, invoice.total
```

Cada respuesta se lee como método (`invoice.uuid`) o como Hash (`invoice[:uuid]`). Las opciones de una llamada (`idempotency_key`, `timeout`, `max_retries`, `expand`) van al final, como palabras clave o en un segundo Hash; las demás palabras clave son los parámetros:

```ruby
fiscalisto.invoices.list(status: "valid").each { |inv| puts inv.uuid }

invoice = fiscalisto.invoices.get("inv_…", expand: ["issuer"])
puts invoice.issuer.legal_name

begin
  fiscalisto.invoices.create(params)
rescue Fiscalisto::InvoiceError => e
  puts e.code, e.param, e.request_log_url
end
```

Webhooks (Rails: `request.raw_post` y `request.headers`; Rack o Sinatra: `request.body.read` y `request.env`):

```ruby
event = Fiscalisto::Webhook.verify(request.raw_post, request.headers, ENV["FISCALISTO_WEBHOOK_SECRET"])
puts event.data.object.uuid if event.type == "invoice.stamped"
```

La guía completa está en [fiscalisto.com/docs/api/sdk](https://fiscalisto.com/docs/api/sdk) y cada página de la [referencia](https://fiscalisto.com/docs/api) trae su ejemplo con el SDK.

## Con agentes de IA

Para que Claude Code, Cursor, Codex u otro agente integre Fiscalisto, conecte el servidor MCP de la documentación (sin llave) y pídale que empiece con `get_started`:

```bash
claude mcp add --transport http fiscalisto-docs https://fiscalisto.com/docs/api/mcp
```

La guía de integración en una página está en [fiscalisto.com/docs/api/SKILL.md](https://fiscalisto.com/docs/api/SKILL.md) y el índice de la documentación para agentes en [llms.txt](https://fiscalisto.com/docs/api/llms.txt). Otros clientes y más: [fiscalisto.com/docs/api/agentes](https://fiscalisto.com/docs/api/agentes).

## Desarrollo

`lib/fiscalisto/resources.rb` y `lib/fiscalisto/error_codes.rb` se generan desde la especificación OpenAPI con `bun run openapi` en la raíz del repositorio; no los edite. Lo demás se escribe a mano.

```bash
ruby -w -Ilib -Itest test/test_fiscalisto.rb   # o: bundle exec rake
gem build fiscalisto.gemspec
```
