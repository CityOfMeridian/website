module Admin
  class RolesController < Fae::BaseController
    before_action :set_role, only: [:show, :edit]

    def new
      @item = Fae::Role.new
    end

    def create
      role = Fae::Role.new(roles_params)
      if role.save
        flash[:info] = "The role was successfully created."
        redirect_to admin_roles_path
      else
        flash[:info] = role.errors.full_messages.first
        redirect_to new_admin_role_path
      end
    end

    def index
      @items = Fae::Role.all
    end

    def show
    end

    def edit
    end

    private

    def roles_params
      params.require(:role).permit(:name, :organizations)
    end

    def set_role
      @item = Fae::Role.find(params[:id])
    end

    def set_class_variables(class_name = 'Fae::Role')
      klass_base = params[:controller].split('/').last
      @klass_name = class_name || klass_base               # used in form views
      @klass = @klass_name.classify.constantize             # used as class reference in this controller
      @klass_singular = klass_base.singularize             # used in index views
      @klass_humanized = klass_base.singularize.humanize  # used in index views
      @index_path = '/' + params[:controller]              # used in form_header and form_buttons partials
      @new_path = @index_path + '/new'                     # used in index_header partial
    end  end
end