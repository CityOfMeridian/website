module Admin
  class ContentBlocksController < Fae::StaticPagesController

    private

    def fae_pages
      [WaterPage, GarbagePage, ParksPage, LibraryPage]
    end
  end
end
