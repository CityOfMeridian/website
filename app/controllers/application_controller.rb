class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :default_members_collection

  def index
    @title = 'City of Meridian'
    @news_items = NewsItem.where('created_at > ?', 2.weeks.ago)
    @latest_public_notice = latest_public_notice
  end

  def edc
    @edc_page = EdcPage.instance
  end

  def calendar
    @calendar_page = CalendarPage.instance
  end

  def council
    @city_council = CityCouncilPage.instance
  end

  def not_found
    render '404'
  end

  def attractions
  end

  private

  def latest_public_notice
    return @public_notices.first if public_notices?
    nil
  end

  def public_notices?
    @public_notices = PublicNotice.active
    @public_notices.count > 0
  end

  def default_members_collection
    @default_members_collection = Organization.default_members_collection_name
  end
end
