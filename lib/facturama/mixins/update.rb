# frozen_string_literal: true

module Facturama
  module Mixins
    module Update
      def update(url = self.class.resource_url)
        requestor = Requestor.new
        response = requestor.request(url + '/' + id, :put, self.class.parsed_params(to_h))
        self
      end
    end
  end
end
