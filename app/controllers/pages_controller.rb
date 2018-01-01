class PagesController < ApplicationController
  layout 'application'
  
  def home
    @title = 'City of Meridian'
    @events = Event.limit(4)
    @public_notices = public_notices
    @latest_public_notice = @public_notices.first if @public_notices.present?
  end

  def calendar
    @events = Event.in_same_month_as(start_date)
  end

  def library
    @library = LibraryPage.instance
  end

  private
  def public_notices
    public_notices = PublicNotice.active
    public_notices.count > 0 ? public_notices : nil
  end

  def start_date
    return params[:start_date].to_date if params[:start_date].present? && params[:start_date].respond_to?(:to_date)
    Date.current
  end
end
