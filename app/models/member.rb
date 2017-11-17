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

end
