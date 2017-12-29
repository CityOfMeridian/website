class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :default_members_collection, :set_city
  before_action :set_news_items, only: [:index]

  def index
    @title = 'City of Meridian'
    @events = Event.limit(4)
    @public_notices = public_notices
    @latest_public_notice = @public_notices.first if @public_notices.present?
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

  def redirect_to_www
    return redirect_to "www.#{ENV["HOST"]}/#{params[:path]}"
  end

  private

  def public_notices
    public_notices = PublicNotice.active
    public_notices.count > 0 ? public_notices : nil
  end

  def default_members_collection
    @default_members_collection = Organization.default_members_collection_name
  end

  def set_city
    @city = Organization.find_by(name: 'City')
  end

  def set_news_items
    @news_items = NewsItem.where('created_at > ?', 2.weeks.ago)
    
  end

end
