# frozen_string_literal: true

require_relative "lib/fiscalisto/version"

Gem::Specification.new do |spec|
  spec.name = "fiscalisto"
  spec.version = Fiscalisto::VERSION
  spec.authors = ["Fiscalisto"]
  spec.summary = "El SDK de la API de facturación de Fiscalisto: CFDI 4.0 desde Ruby."
  spec.description = "Timbre facturas, pagos, notas de crédito, nómina, retenciones y lotes (CFDI 4.0) " \
                     "con la API de Fiscalisto: Idempotency-Key automática, reintentos seguros, listas " \
                     "que se recorren solas y webhooks verificados. Sin dependencias."
  spec.homepage = "https://fiscalisto.com/docs/api/sdk"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"
  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "documentation_uri" => "https://fiscalisto.com/docs/api",
    "source_code_uri" => "https://github.com/fiscalisto/fiscalisto-ruby",
    "changelog_uri" => "https://fiscalisto.com/docs/api/cambios",
    "rubygems_mfa_required" => "true"
  }
  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]
end
