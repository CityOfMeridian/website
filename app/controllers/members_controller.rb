class MembersController < ApplicationController
  def index
    @organization = Organization.default_organization
    @leader = @organization.leader
    @members = @organization.members.select { |mem| mem != @leader }
  end
end
