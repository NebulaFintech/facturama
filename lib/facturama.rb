require 'facturama/version'
require 'facturama/requestor'
require 'facturama/resource'
require 'facturama/mixins/create'
require 'facturama/mixins/delete'
require 'facturama/mixins/save'
require 'facturama/mixins/update'
require 'facturama/mixins/find'
require 'facturama/mixins/all'
require 'facturama/api_lite'
require 'facturama/csd'

module Facturama
  require 'active_support'
  require 'active_support/core_ext'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    require 'faraday'
    attr_accessor :api_base, :connection, :user, :password

    def initialize
      @api_base = 'https://apisandbox.facturama.mx'
      @connection = Faraday.new
      @passwod = nil
    end
  end
end
