module Admin
  class OrganizationsController < Fae::BaseController

    def index
      @items = Organization.all
      @meetings = Meeting.joins(:organizations).distinct
    end

    def edit
      @parent_item = Organization.find(params[:id])
    end
  end
end
