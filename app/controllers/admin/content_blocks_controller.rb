module Admin
  class ContentBlocksController < Fae::StaticPagesController

    private

    def fae_pages
      [LibraryPage, PolicePage, VfdPage, EdcPage, CalendarPage, CityCouncilPage]
    end
  end
end
