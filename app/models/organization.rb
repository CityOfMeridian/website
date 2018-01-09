class Organization < ApplicationRecord
  include Fae::BaseModelConcern

  DEFAULT_ORGANIZATION = %w(city).freeze
  EXPECTED_LEADER_TITLES = %w(mayor mayor_pro_tem).freeze

  has_many :roles
  has_many :meetings
  has_many :members
  has_many :public_notices
  has_many :events
  has_many :news_items
  belongs_to :leader, class_name: 'Member'
  belongs_to :second_leader, class_name: 'Member'
  belongs_to :fae_static_page, class_name: 'Fae::StaticPage'

  scope :community, -> { where(community: true) }
  scope :not_community, -> { where(community: false) }

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
    type == 'community'
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
