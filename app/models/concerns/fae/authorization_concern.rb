module Fae
  module AuthorizationConcern
    extend ActiveSupport::Concern
    module ClassMethods
      # Use the access_map to define any controllers that need any special authorization
      # Fae comes with three default roles:
      # - super admin: CRUD all objects, INCLUDING users and root settings
      # - admin: CRUD all objects, INCLUDING users and EXCLUDING root settings
      # - users: CRUD all objects, EXCLUDING users and root settings

      # each item should have a string key of the plural controller name and
      # an array of role names for the value
      # use "content_blocks/#{page_name}" for content blocks

      # example:
      # {
      #  'people' => ['super admin', 'admin'],
      #  'content_blocks/about_us' => ['super admin']
      # }
      def government_access_map
        ['agendas', 'minutes', 'public_notices', 'news_items', 'events']
      end

      def community_access_map
        ['events', 'news_items']
      end

      def access_map
        @map = {}
        add_organization_page_permissions
        add_organization_type_permissions
        @map
      end

      def add_organization_page_permissions
        Fae::Role.public_roles.each do |role|
          if role.organization.present? && role.organization.fae_static_page.present?
            page_name = "content_blocks/#{role.organization_page_title.downcase}"
            admin_prefix = role.organization_admin_prefix.present? ? role.organization_admin_prefix : role.organization_name.downcase
            @map[page_name] = ['super_admin', 'admin', "#{admin_prefix} admin"]
          end
        end
      end

      def add_organization_type_permissions
        Fae::Role.public_roles.each do |role|
          next if role.organization.nil?
          if role.organization.type == 'government'
            government_access_map.each do |page|
              admin_prefix = role.organization_prefix.present? ? role.organization_prefix : role.organization_name.downcase
              @map[page] = ['super_admin', 'admin', "#{admin_prefix} admin"] unless @map.has_key? page
              @map[page] << "#{admin_prefix} admin" if @map.has_key?(page) && !@map[page].include?(admin_prefix)
            end
          end
        end
      end
    end
  end
end
