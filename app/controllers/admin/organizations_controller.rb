module Admin
  class OrganizationsController < Fae::BaseController
    before_action :set_parent_item, only: [:edit]

    def index
      @items = Organization.all
      @meetings = Meeting.joins(:organizations).distinct
    end

    def edit
    end

    
    private
    def set_parent_item
      @parent_item = Organization.find(params[:id])
    end
  end
end
