# frozen_string_literal: true

module Facturama
  class Csd < ApiLite
    include Mixins::Create
    include Mixins::Delete
    include Mixins::Save
    include Mixins::Update
    include Mixins::Find
    include Mixins::All

    ATTR_IVARS = %i[rfc certificate private_key private_key_password upload_date].freeze

    def initialize(params = {})
      params = params.with_indifferent_access
      @id = (params[:rfc] || params[:Rfc])
      super(params)
    end
  end
end
