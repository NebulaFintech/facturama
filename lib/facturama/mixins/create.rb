# frozen_string_literal: true

module Facturama
  module Mixins
    module Create
      module ClassMethods
        def create(params = {})
          requestor = Requestor.new
          response = requestor.request(resource_url, :post, parsed_params(params))
          new(params)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
