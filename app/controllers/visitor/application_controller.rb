module Visitor
  class ApplicationController < ::ApplicationController
    def index
      @events = Event.recent
    end
  end
end