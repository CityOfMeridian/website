class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :default_members_collection, :set_layout_variables

  def index
    @title = 'City of Meridian'
    @news_items = NewsItem.where('created_at > ?', 2.weeks.ago)
    @events = Event.limit(4)
    @public_notices = public_notices
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

  def public_notices
    public_notices = PublicNotice.active
    public_notices.count > 0 ? public_notices : nil
  end

  def default_members_collection
    @default_members_collection = Organization.default_members_collection_name
  end

  def set_layout_variables
    @city = Organization.find_by(name: 'City')
  end
end
