class EventsController < ApplicationController
  before_action :set_news_items, only: [:index, :show]
  layout 'application'
  
  def index
    @events = Event.order('date desc').page(params[:page]).per(5)
  end

  def show
    @events = Event.where(id: params[:id]).page(params[:page]).per(1)
    render 'index'
  end
end