class EventsController < ApplicationController
  before_action :set_news_items, only: [:index, :show]
  layout 'application'
  
  def index
    @events = Event.order(date: :desc).page(params[:page]).per(5)
  end

  def show
    @event = Event.find(params["id"])
  end
end