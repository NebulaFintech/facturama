# frozen_string_literal: true

module Facturama
  class Csd < ApiLite
    include Mixins::Create
    include Mixins::Delete
    include Mixins::Save

    ATTR_IVARS = %i[rfc certificate private_key private_key_password].freeze

    def initialize(params = {})
      params = params.with_indifferent_access
      @id = params[:rfc]
      super(params)
    end
  end
end
