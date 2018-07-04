# frozen_string_literal: true

module Facturama
  module Mixins
    module Create
      module ClassMethods
        def create(params = {}, url = resource_url)
          requestor = Requestor.new
          response = requestor.request(url, :post, parsed_params(params))
          new(params)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
