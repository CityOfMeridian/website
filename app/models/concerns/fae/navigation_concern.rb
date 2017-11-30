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
      structure = [
            item('Pages', subitems: [
                item('Library', path: fae.edit_content_block_path('library')),
                item('VFD', path: fae.edit_content_block_path('vfd')),
                item('Police', path: fae.edit_content_block_path('police')),
                item('EDC', path: fae.edit_content_block_path('edc')),
                item('Calendar', path: fae.edit_content_block_path('calendar')),
                item('City Council', path: fae.edit_content_block_path('city_council'))
                ]
            ),
            item('Events', path: admin_events_path),
            item('News Items', path: admin_news_items_path),
            item('Public Notices', path: admin_public_notices_path),
            item('Places', path: admin_places_path),
        ]
        if current_user.organizations.count > 1
            subitems = []
            current_user.organizations.all.each do |org|
                subitems.unshift(item(org.name, path: edit_admin_organization_path(id: org.id)))
            end 
            structure.unshift(item('Organizations', subitems: subitems))
        else
            structure.unshift(item(current_user.organizations[0].name, path: edit_admin_organization_path(id: current_user.organizations[0].id)))
        end
        structure
    end

  end
end
