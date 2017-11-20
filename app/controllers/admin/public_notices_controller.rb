module Admin
  class PublicNoticesController < Fae::BaseController
    before_action :resources, only: [:new, :edit]
    after_action :selected_noticeable, only:[:create, :update]

    def resources
      @organizations = current_user.organizations || [@item.organization]
      @noticeables = noticeables
    end

    def noticeables
      noticeables = {}
      PublicNotice::NOTICEABLE_TYPES.each do |type|
        noticeables[type.pluralize] = eval("#{type}.where(organization: @organizations).map { |noticeable| [noticeable.title, \"[\#{type}]\#{noticeable.id}\"] }")
      end
      noticeables
    end

    def selected_noticeable
      param_elements = params[:public_notice_noticeable].split(/\[(.*?)\]/)
      noticeable_klass = param_elements.second.constantize
      @item.noticeable =  noticeable_klass.find(param_elements.third)
      @item.save
    end

    private

    def permitted_params
      params.require(:public_notice).permit!
    end
  end
end
