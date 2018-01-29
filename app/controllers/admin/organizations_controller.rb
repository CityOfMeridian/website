module Admin
  class OrganizationsController < Fae::BaseController
    before_action :set_parent_item, only: [:edit, :new]

    def index
      @items = current_user.permitted_organizations
      @meetings = Meeting.joins(:organizations).distinct
    end

    def edit
    end

    private
    def set_parent_item
      @parent_item = Organization.find(params[:id]) if params.has_key? :id
    end
  end
end
