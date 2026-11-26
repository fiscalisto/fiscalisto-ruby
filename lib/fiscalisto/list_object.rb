# frozen_string_literal: true

module Fiscalisto
  # Una lista: +data+ y +has_more+ son la primera página; +each+ (y todo Enumerable: map, select,
  # first(50), to_a…) recorre todos los objetos, página por página, pidiendo la siguiente solo
  # cuando hace falta.
  #
  #   fiscalisto.invoices.list(status: "valid").each { |invoice| puts invoice.uuid }
  class ListObject
    include Enumerable

    # page: lambda(cursor) que contesta una página (Hash de la API); forward: con
    # ending_before las páginas van hacia lo más nuevo.
    def initialize(page, forward: false)
      @page = page
      @forward = forward
      @first = nil
    end

    # La primera página como la contesta la API (object, data, has_more, url).
    def first_page
      @first ||= @page.call(nil)
    end

    def data
      first_page["data"]
    end

    def has_more
      first_page["has_more"] ? true : false
    end
    alias has_more? has_more

    def url
      first_page["url"]
    end

    # lista[:data], lista["has_more"]: la primera página.
    def [](key)
      first_page[key]
    end

    def each(&block)
      return enum_for(:each) unless block

      page = first_page
      loop do
        items = page["data"] || []
        (@forward ? items.reverse : items).each(&block)
        break if !page["has_more"] || items.empty?

        page = @page.call((@forward ? items.first : items.last)["id"])
      end
      self
    end
    # El nombre de Stripe.
    alias auto_paging_each each

    def inspect
      "#<#{self.class.name} url=#{url.inspect} has_more=#{has_more}>"
    end
  end
end
