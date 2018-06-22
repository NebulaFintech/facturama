# frozen_string_literal: true

module Facturama
  module Mixins
    module Save
      def save
        requestor = Requestor.new
        response = requestor.request(self.class.resource_url, :post, self.class.parsed_params(self.to_h))
        self
      end
    end
  end
end
