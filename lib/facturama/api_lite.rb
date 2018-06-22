# frozen_string_literal: true

module Facturama
  class ApiLite < Resource
    def initialize(params = {})
      super(params)
    end

    class << self
      def resource_url
        'api-lite/' + name.demodulize.to_s.camelize(:lower).pluralize
      end
    end
  end
end
