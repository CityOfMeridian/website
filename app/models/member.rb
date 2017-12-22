class Member < ApplicationRecord
  include Fae::BaseModelConcern

  has_fae_image :image

  belongs_to :organization, touch: true, foreign_key: :organization_id
  belongs_to :organization_led, class_name: 'Organization', foreign_key: :leader_id
  belongs_to :organization_second_led, class_name: 'Organization', foreign_key: :second_leader_id
  scope :active, -> { where(active: true).order(:active) }

  def fae_nested_parent
    :organization
  end

  def fae_display_field
    name
  end

  def leader?
    self == organization.leader
  end

  def second_leader?
    self == organization.second_leader
  end

  def default_member?
    !leader? && !second_leader?
  end

  def title
    return organization.leader_title if leader?
    return organization.second_leader_title if second_leader?
    return organization.default_member_title
  end

  def term
    "#{pretty_date(term_start)} - #{pretty_date(term_end)}"
  end

  def order_number
    return 1 if leader?
    return 2 if second_leader?
    return 3
  end

end
