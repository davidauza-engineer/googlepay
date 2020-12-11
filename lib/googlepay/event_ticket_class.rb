# frozen_string_literal: true

module Googlepay
  class EventTicketClass < GooglePayClass
    API_URL = BASE_URL + 'eventTicketClass'

    def create
      super(API_URL)
    end

    def update
      super(API_URL)
    end
  end
end
