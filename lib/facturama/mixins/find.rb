# frozen_string_literal: true

module Facturama
  module Mixins
    module Find
      module ClassMethods
        def find(id, url = resource_url)
          requestor = Requestor.new
          response = requestor.request(url + '/' + id, :get)
          new(response)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
