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
        @map = { 
          "organization_types" =>  ['super admin'],
          "roles" => ['super admin']
        }
        add_organization_page_permissions
        add_organization_type_permissions
        p @map
        @map
      end

      def add_organization_page_permissions
        Fae::Role.all.each do |role|
          role.organizations.each do |organization|
            if organization.pages.any?
              organization.pages.each do |page|
                page_name = "content_blocks/#{page.title.downcase}"
                admin_prefix = organization.admin_prefix.present? ? organization.admin_prefix : organization.name.downcase
                @map[page_name] = ['super admin', 'admin', "#{admin_prefix} admin"] unless @map.has_key? page_name
                @map[page_name] << "#{admin_prefix} admin" if !@map[page].include?(admin_prefix)
              end
            end
          end
        end
      end

      def add_organization_type_permissions
        Fae::Role.all.each do |role|
          role.organizations.each do |organization|
            if organization.type_name == 'government' || role.name == "super admin"
              government_access_map.each do |page|
                admin_prefix = organization.admin_prefix.present? ? organization.admin_prefix : organization.name.downcase
                @map[page] = ['super admin', 'admin', "#{admin_prefix} admin"] unless @map.has_key? page
                @map[page] << "#{admin_prefix} admin" unless !@map[page].include?(admin_prefix)
              end
            elsif organization.type_name == 'community' || role.name == "super admin"
              community_access_map.each do |page|
                admin_prefix = organization.admin_prefix.present? ? organization.admin_prefix : organization.name.downcase
                @map[page] = ['super admin', 'admin', "#{admin_prefix} admin"] unless @map.has_key? page
                @map[page] << "#{admin_prefix} admin" unless !@map[page].include?(admin_prefix)
              end
            end
          end
        end
      end
    end
  end
end
