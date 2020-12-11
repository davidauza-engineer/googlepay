# frozen_string_literal: true

module Googlepay
  class GooglePayClass
    BASE_URL = 'https://www.googleapis.com/walletobjects/v1/'

    def initialize(parameters)
      @parameters = parameters
    end

    def create(api_url)
      result = HTTParty.post("#{api_url}?access_token=#{Googlepay.token}",
                             body: @parameters.to_json,
                             headers: { 'Content-Type' => 'application/json' })
      return result if result['error'].nil?

      update if result['error']['code'] == 409
    end

    def update(api_url)
      HTTParty.put("#{api_url}/#{@parameters[:id]}?access_token=#{Googlepay.token}",
                   body: @parameters.to_json,
                   headers: { 'Content-Type' => 'application/json' })
    end
  end
end
