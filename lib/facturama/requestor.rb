# frozen_string_literal: true

module Facturama
  class Requestor
    attr_reader :user, :password, :connection, :api_base

    def initialize
      raise 'Facturama.configure has not been called!' unless Facturama.configuration

      @user = Facturama.configuration.user
      @password = Facturama.configuration.password
      raise 'User has not been set!' if @user.blank?
      raise 'Password has not been set!' if @password.blank?

      @connection = Facturama.configuration.connection
      @api_base = Facturama.configuration.api_base
    end

    def self.join_url(url, path)
      url.to_s + '/' + path.to_s
    end

    def request(resource_url, http_method, params = {})
      set_headers_for(connection)
      response = connection.method(http_method).call do |request|
        request.url self.class.join_url(api_base, resource_url)
        set_request_params(request, params) if params.present?
      end
      handle_response(response)
    end

    private

    def set_headers_for(connection)
      connection.basic_auth(user, password)
      connection.headers['User-Agent'] = ''
      connection.headers['Accept'] = 'application/json'
      connection.headers['Content-type'] = 'application/json'
      connection.headers['Cache-Control'] = 'no-cache'
    end

    def set_request_params(request, params)
      case request.method
      when :post, :put
        request.body = params.to_json
      when :get
        request.params = params
      end
    end

    def handle_response(response)
      json_response = begin
                        JSON.parse(response.body)
                      rescue StandardError
                        {}
                      end
      unless response.success?
        error_message = json_response['Message']
        error_message ||= response.reason_phrase
        raise error_message
      end
      json_response
    end
  end
end
