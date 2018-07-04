# frozen_string_literal: true

module Facturama
  module Mixins
    module Delete
      def delete(url = self.class.resource_url)
        requestor = Requestor.new
        response = requestor.request(url + '/' + id, :delete)
        self
      end
    end
  end
end
