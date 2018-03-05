class PagesController < ApplicationController
  layout 'application'

  def show
    @page_model = Fae::StaticPage.find_by(slug: params[:slug]) || Fae::StaticPage.first
    set_page_variable
    render page_view_file
  end
  
  def home
    @title = 'City of Meridian'
    @events = Event.coming_soon.limit(4)
    @public_notices = public_notices
    @latest_public_notice = @public_notices.first if @public_notices.present?
  end

  def calendar
    @events = Event.in_same_month_as(start_date)
  end

  def library
    @library = LibraryPage.instance
  end

  def water_garbage
    @water_garbage = WaterGarbagePage.instance
    @contact = Contact.new
  end

  def parks
    @parks = ParksPage.instance
  end

  def community_organizations
    @organizations = CommunityOrganization.all
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

  def page_view_file
    return "#{@page_model.page_class_name.underscore}.html.erb" if has_custom_template?
    return "templates/#{@page_model.template_name}" if @page_model.template.present?
    return "templates/#{Fae::StaticPage::DEFAULT_TEMPLATE}"
  end

  def has_custom_template?
    File.exist? Rails.root.join('app','views', "pages", "#{@page_model.page_class_name.underscore}.html.erb").to_s
  end

  def set_page_variable
    if has_custom_template?
      instance_variable_set("@#{@page_model.page_class_name.underscore}", @page_model.constant_name.instance)
      @contact = Contact.new
    else
      @page = @page_model.constant_name.instance
    end
  end
end
