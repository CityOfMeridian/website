class EventsController < ApplicationController
  before_action :set_news_items, only: [:index]
  layout 'application'
  
  def index
    @events = Event.order('date desc')
    @events = Kaminari.paginate_array(@events).page(params[:page]).per(5)
  end
end