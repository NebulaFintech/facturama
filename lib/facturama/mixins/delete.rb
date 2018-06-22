# frozen_string_literal: true

module Facturama
  module Mixins
    module Delete
      def delete
        requestor = Requestor.new
        response = requestor.request(self.class.resource_url + '/' + id, :delete)
        self
      end
    end
  end
end
