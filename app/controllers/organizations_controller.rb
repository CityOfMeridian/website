class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
    @members = @organization.members.active.sort do |a, b|
      a.order_number <=> b.order_number
    end
    @next_meeting = @organization.next_meeting
    @year_meetings = @organization.meetings.this_year
  end
end
