module Fae
  class Role < ActiveRecord::Base

    include Fae::BaseModelConcern
    include Fae::RoleConcern

    has_many :users, class_name: "Fae::User"
    delegate :name, :admin_prefix, :type_name, to: :organization, prefix: true
    has_and_belongs_to_many :organizations, foreign_key: "fae_role_id"

    acts_as_list add_new_at: :bottom
    default_scope { order('-position DESC') }

    scope :public_roles, -> {where.not(name: 'super admin')}


    def fae_tracker_blacklist
      'all'
    end

    def organization_page_title
      organization.page_title
    end

    def fae_display_field
      name
    end
  end
end
