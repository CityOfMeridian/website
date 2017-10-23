module Fae
  module NavigationConcern
    extend ActiveSupport::Concern

    # define the navigation structure in this file
    # example structure:
    #
    # def structure
    #   [
    #     item('Top Nav Item 1', subitems: [
    #       item('Top Nav Dropdown Item 1', class: 'custom-class', path: some_named_route_path),
    #       item('Top Nav Dropdown Item 2', subitems: [
    #         item('Side Nav Item 1', subitems: [
    #           item('Side Nav Nested Item', path: some_named_route_path)
    #         ]),
    #         item('Side Nav Item 1', path: some_named_route_path)
    #       ]),
    #     ]),
    #     item('Pages', subitems: [
    #       item('Home', path: fae.edit_content_block_path('home')),
    #       item('About Us', path: fae.edit_content_block_path('about_us'))
    #     ])
    #   ]
    # end

    def structure
      [
        item('Events', path: admin_events_path),
        item('News Items', path: admin_news_items_path),
        item('Agendas', path: admin_agendas_path),
        item('Minutes', path: admin_minutes_path),
        item('Pages', subitems: [
            item('Library', path: fae.edit_content_block_path('library')),
            item('VFD', path: fae.edit_content_block_path('vfd')),
            item('Police', path: fae.edit_content_block_path('police')),
            item('EDC', path: fae.edit_content_block_path('edc')),
            item('Calendar', path: fae.edit_content_block_path('calendar')),
            item('City Council', path: fae.edit_content_block_path('city_council'))
        ]),
        # scaffold inject marker
      ]
    end

  end
end
