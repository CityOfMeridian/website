class EventsController < ApplicationController
  before_action :set_news_items, only: [:index, :show]
  layout 'application'
  
  def index
    @events = Event.order(:date).page(params[:page]).per(5)
  end

  def show
    @events = Event.find(id: params[:id])
    render 'index'
  end
end