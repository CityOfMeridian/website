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
      @structure = [
            item('Events', path: admin_events_path),
            item('News Items', path: admin_news_items_path),
            item('Public Notices', path: admin_public_notices_path),
            item('Places', path: admin_places_path),
            item('Roles', path: admin_roles_path)
        ]
        add_organization_nav_links
        add_pages_nav_links
        @structure
    end

    def add_organization_nav_links
        subitems = []
        current_user.permitted_organizations.each do |org|
            subitems.unshift(item(org.name, path: edit_admin_organization_path(id: org.id)))
        end 
        @structure.unshift(item('Organizations', subitems: subitems, path: admin_organizations_path))
    end

    def add_pages_nav_links
        subitems = []
        current_user.permitted_pages.each do |page|
            subitems.unshift(item(page.fae_display_field, path: fae.edit_content_block_path(page.slug)))
        end 
        @structure.unshift(item('Pages', subitems: subitems, path: fae.pages_path))
    end
  end
end
