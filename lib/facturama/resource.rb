# frozen_string_literal: true

module Facturama
  class Resource
    attr_accessor :id
    def initialize(params = {})
      @id ||= params[:id]
      raise ArgumentError, 'Id must be specified!' if @id.blank?
      set_instance_variables
      params.each do |k, v|
        send(k + '=', v)
      end
    end

    def self.parsed_params(params)
      parsed_params = {}
      params.each { |k, v| parsed_params[k.to_s.camelize] = v }
      parsed_params
    end

    def to_h
      h = {}
      self.class::ATTR_IVARS.each do |ivar|
        h[ivar] = self.send(ivar)
      end
      h
    end

    private

    def set_instance_variables
      self.class::ATTR_IVARS.each do |ivar|
        singleton_class.class_eval { attr_accessor ivar.to_s }
      end
    end
  end
end
