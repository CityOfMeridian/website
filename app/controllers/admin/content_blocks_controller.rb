module Admin
  class ContentBlocksController < Fae::StaticPagesController
    before_action :set_contacts
    PAGE_SLUGS = %(water_garbage parks_page).freeze

    private

    def fae_pages
      [ParksPage, LibraryPage, WaterGarbagePage]
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
  end
end
