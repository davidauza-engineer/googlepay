# frozen_string_literal: true

module Googlepay
  class LoyaltyClass < GooglePayClass
    API_URL = BASE_URL + 'loyaltyClass'

    def create
      super(API_URL)
    end

    def update
      super(API_URL)
    end
  end
end
