class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :default_members_collection, :set_organizations
  before_action :set_news_items, only: [:index]

  def not_found
    render '404'
  end

  def redirect_to_www
    return redirect_to "www.#{ENV["HOST"]}/#{params[:path]}"
  end

  def privacy_policy
  end

  private
  def default_members_collection
    @default_members_collection = Organization.default_members_collection_name
  end

  def set_organizations
    @organizations = Organization.all
    @city = Organization.find_by(name: 'City Council')
  end

  def set_news_items
    @news_items = NewsItem.where('created_at > ?', 2.weeks.ago)
  end
end
