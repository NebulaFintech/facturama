# frozen_string_literal: true

module Facturama
  module Mixins
    module All
      module ClassMethods
        def all
          requestor = Requestor.new
          response = requestor.request(resource_url, :get)
          response.map do |r|
            new(r)
          end
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
