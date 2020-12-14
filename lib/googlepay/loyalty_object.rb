# frozen_string_literal: true

module Googlepay
  class LoyaltyObject < GooglePayObject
    API_URL = BASE_URL + 'loyaltyObject?'
    OBJECT_TYPE = 'loyaltyObjects'

    def create
      super(API_URL, OBJECT_TYPE)
    end
  end
end
