# frozen_string_literal: true

module Facturama
  module Mixins
    module Update
      def update
        requestor = Requestor.new
        response = requestor.request(self.class.resource_url + '/' + id, :put, self.class.parsed_params(self.to_h))
        self
      end
    end
  end
end
