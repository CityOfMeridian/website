class OrganizationsController < ApplicationController
  def show
    @organization = Organization.default_organization
    @members = @organization.members.active.sort do |a, b|
      a.order_number <=> b.order_number
    end
    @next_meeting = @organization.next_meeting
    pry
  end
end
