# frozen_string_literal: true

module Facturama
  module Mixins
    module Save
      def save(url = self.class.resource_url)
        requestor = Requestor.new
        response = requestor.request(url, :post, self.class.parsed_params(to_h))
        self
      end
    end
  end
end
