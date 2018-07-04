# frozen_string_literal: true

module Facturama
  module Mixins
    module Find
      module ClassMethods
        def find(id)
          requestor = Requestor.new
          response = requestor.request(resource_url + '/' + id, :get)
          new(response)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
