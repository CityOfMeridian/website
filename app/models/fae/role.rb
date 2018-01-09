module Fae
  class Role < ActiveRecord::Base

    include Fae::BaseModelConcern
    include Fae::RoleConcern

    has_many :users
    belongs_to :organization
    delegate :name, :admin_prefix, to: :organization, prefix: true

    acts_as_list add_new_at: :bottom
    default_scope { order('-position DESC') }

    scope :public_roles, -> {where.not(name: 'super admin')}


    def fae_tracker_blacklist
      'all'
    end

    def organization_page_title
      organization.page_title
    end
  end
end
