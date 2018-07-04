# frozen_string_literal: true

module Facturama
  class Cfdi < ApiLite
    include Mixins::Create
    include Mixins::Save
    include Mixins::Find
    include Mixins::Delete
    include Mixins::Where

    ATTR_IVARS = %i[serie currency expedition_place payment_conditions
                    folio cfdi_type payment_form payment_method issuer receiver items].freeze

    def initialize(params = {})
      params = params.with_indifferent_access
      @id = 'noid'
      super(params)
    end

    def save(url = self.class.resource_url('2/'))
      super(url)
    end

    class << self
      def create(params = {}, url = resource_url('2/'))
        super(params, url)
      end

      def download(id, options = {})
        format = options.fetch(:format, 'xml')
        type = options.fetch(:type, 'issuedLite')
        cancelation_receipt = options(:cancelation_receipt, false)
        url = if cancelation_receipt
                'api-lite/' + format + '/' + type + '/'
              else
                resource_url(format + '/' + type + '/')
              end
        requestor = Requestor.new
        requestor.request(url + '/' + id, :get)
      end
    end
  end
end
