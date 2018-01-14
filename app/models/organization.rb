class Organization < ApplicationRecord
  include Fae::BaseModelConcern

  DEFAULT_ORGANIZATION = %w(city).freeze
  EXPECTED_LEADER_TITLES = %w(mayor mayor_pro_tem).freeze

  has_many :meetings
  has_many :members
  has_many :public_notices
  has_many :events
  has_many :news_items
  has_and_belongs_to_many :pages, class_name: 'Fae::StaticPage', association_foreign_key: "fae_static_page_id"
  has_and_belongs_to_many :roles, class_name: 'Fae::Role', association_foreign_key: "fae_role_id"

  belongs_to :organization_type
  belongs_to :type, class_name: "OrganizationType", foreign_key: "organization_type_id"
  belongs_to :leader, class_name: 'Member'
  belongs_to :second_leader, class_name: 'Member'

  delegate :name, to: :type, prefix: true

  scope :community, -> { where(type: OrganizationType.community) }
  scope :not_community, -> { where.not(type: OrganizationType.community) }

  def fae_display_field
    name
  end

  def leader_titles
    [leader_title, second_leader_title]
  end

  def next_meeting
    meetings.ordered.first
  end

  def page_title
    return fae_static_page.title if fae_static_page.present?
    nil
  end

  def community?
    type_name == 'community'
  end

  class << self
    def default_organization
      Organization.find_by(name: Organization::DEFAULT_ORGANIZATION.first.humanize)
    end

    def default_members_collection_name
      default_organization.members_collection_name
    end
  end
end
