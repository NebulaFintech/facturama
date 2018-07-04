# frozen_string_literal: true

module Facturama
  class ApiLite < Resource
    def initialize(params = {})
      super(params)
    end

    class << self
      def resource_url(non_restful_path = '')
        'api-lite/' + non_restful_path + name.demodulize.to_s.camelize(:lower).pluralize
      end
    end
  end
end
