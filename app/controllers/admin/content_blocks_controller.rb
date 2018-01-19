module Admin
  class ContentBlocksController < Fae::StaticPagesController
    before_action :set_contacts
    PAGE_SLUGS = %(water_garbage parks_page).freeze

    private

    def fae_pages
      return current_user.permitted_pages.active.map { |page| "#{page_name(page)}Page".constantize } unless current_user.super_admin?
      current_user.permitted_pages.map { |page| "#{page_name(page)}Page".constantize }
    end

    def set_contacts
      @contacts = page_scoped_contacts
    end

    def page_scoped_contacts
      params_has_page_slug? ? Contact.send(params['slug']).page(params[:page]).per(10) : nil
    end

    def params_has_page_slug?
      (params.has_key?('slug') && PAGE_SLUGS.include?(params['slug']))
    end

    def page_name(page)
      return page.class_name unless page.class_name.nil?
      page.title.titleize.delete(' ')
    end
  end
end
