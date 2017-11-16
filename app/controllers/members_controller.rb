class MembersController < ApplicationController
  def index
    @organization = Organization.find_by('City')
    @leader = organization.leader
    @members = organization.members.select { |mem| mem != @leader }
  end
end
