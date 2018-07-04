# frozen_string_literal: true

module Facturama
  module Mixins
    module Where
      module ClassMethods
        def where(params = {}, url = resource_url)
          requestor = Requestor.new
          response = requestor.request(url, :get, parsed_params(params))
          response.map do |r|
            new(r)
          end
        end

        def all(url = resource_url)
          where({}, url)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
