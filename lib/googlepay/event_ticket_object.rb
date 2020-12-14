# frozen_string_literal: true

module Googlepay
  class EventTicketObject < GooglePayObject
    API_URL = BASE_URL + 'eventTicketObject?'
    OBJECT_TYPE = 'eventTicketObjects'

    def create
      super(API_URL, OBJECT_TYPE)
    end
  end
end
