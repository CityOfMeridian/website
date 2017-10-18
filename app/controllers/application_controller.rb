class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @title = 'City of Meridian'
    @news_items = NewsItem.where('created_at < ?', 2.weeks.ago)
  end

  def edc
    @edc_page = EdcPage.instance
  end

  def calendar
    @calendar_page = CalendarPage.instance
  end
end
