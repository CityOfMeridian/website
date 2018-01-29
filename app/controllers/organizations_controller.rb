class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
    @members = @organization.members.active.sort do |a, b|
      a.order_number <=> b.order_number
    end
    @next_meeting = @organization.next_meeting
    @year_meetings = @organization.meetings.this_year
    @organization_page = @organization.fae_static_page.constant_name.instance if @organization.fae_static_page.present?
  end

  def community_organizations
    @community_organizations = Organization.community.page(params[:page]).per(5)
  end
end
