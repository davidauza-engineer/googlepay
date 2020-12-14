# frozen_string_literal: true

module Googlepay
  class GooglePayObject
    BASE_URL = 'https://www.googleapis.com/walletobjects/v1/'

    def initialize(parameters)
      @parameters = parameters
    end

    def create(api_url, object_type)
      rsa_private = OpenSSL::PKey::RSA.new Googlepay.configuration.service_account[:private_key]
      create_object(@parameters, api_url)
      payload = {
          "iss": Googlepay.configuration.service_account[:client_email],
          "aud": 'google',
          "typ": 'savetoandroidpay',
          "iat":  Time.now.utc.to_i,
          "payload": {
              "#{object_type}": [@parameters.dup.tap { |h| h.delete(:origin) }]
          },
          'origins': @parameters.fetch(:origin)
      }
      JWT.encode payload, rsa_private, 'RS256'
    end

    private

    def create_object(object, api_url)
      HTTParty.post("#{api_url}access_token=#{Googlepay.token}",
                    :body => object.to_json,
                    :headers => { 'Content-Type' => 'application/json' } )
    end
  end
end
