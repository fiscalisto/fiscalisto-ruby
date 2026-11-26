# frozen_string_literal: true

module Fiscalisto
  # Un objeto de la API: léalo como método (+invoice.uuid+) o como Hash (+invoice[:uuid]+,
  # +invoice["uuid"]+). Los objetos de adentro también lo son, y un campo expandido
  # (expand: ["issuer"]) trae aquí el objeto en lugar de su id. Un campo que se llama como un
  # método de Ruby (+class+, +hash+, +method+…) se lee con [].
  # (Sin Enumerable a propósito: count, first, max… son nombres de campos.)
  class FiscalistoObject
    # El JSON de la API como FiscalistoObject (y sus listas y objetos de adentro).
    def self.construct(value)
      case value
      when Hash then new(value)
      when Array then value.map { |v| construct(v) }
      else value
      end
    end

    def initialize(values = {})
      @values = values.to_h { |k, v| [k.to_s, self.class.construct(v)] }
    end

    def [](key)
      @values[key.to_s]
    end

    def []=(key, value)
      @values[key.to_s] = self.class.construct(value)
    end

    def key?(key)
      @values.key?(key.to_s)
    end
    alias include? key?

    def keys
      @values.keys
    end

    def dig(key, *rest)
      value = self[key]
      rest.empty? || value.nil? ? value : value.dig(*rest)
    end

    def fetch(key, *default, &block)
      @values.fetch(key.to_s, *default, &block)
    end

    def each(&block)
      @values.each(&block)
    end

    # Como Hash, con llaves String (y sus objetos de adentro también).
    def to_h
      @values.transform_values { |v| self.class.plain(v) }
    end
    alias to_hash to_h

    def to_json(*args)
      require "json"
      to_h.to_json(*args)
    end

    def ==(other)
      other.is_a?(FiscalistoObject) ? to_h == other.to_h : to_h == other
    end

    def inspect
      id = @values["id"] ? " id=#{@values["id"].inspect}" : ""
      "#<#{self.class.name}[#{@values["object"] || "object"}]#{id} #{to_h.inspect}>"
    end
    alias to_s inspect

    def method_missing(name, *args)
      key = name.to_s
      if key.end_with?("=") && args.length == 1
        self[key.chomp("=")] = args.first
      elsif args.empty? && @values.key?(key)
        @values[key]
      elsif args.empty? && key.end_with?("?") && @values.key?(key.chomp("?"))
        !!@values[key.chomp("?")]
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      key = name.to_s.chomp("=").chomp("?")
      @values.key?(key) || super
    end

    def self.plain(value)
      case value
      when FiscalistoObject then value.to_h
      when Array then value.map { |v| plain(v) }
      else value
      end
    end
  end
end
