class Member < ApplicationRecord
  include Fae::BaseModelConcern
  Organization::EXPECTED_LEADER_TITLES.each do |title|
    define_method("#{title}?") do
      titles.include? title
    end
  end

  has_fae_image :image

  belongs_to :organization, touch: true, foreign_key: :organization_id
  belongs_to :organization_led, class_name: 'Organization', foreign_key: :leader_id
  belongs_to :organization_second_led, class_name: 'Organization', foreign_key: :second_leader_id


  def fae_nested_parent
    :organization
  end

  def fae_display_field
    name
  end

  def titles
    titles = []
    return titles if organization.nil?
    titles << organization.leader_title if organization == organization_led
    titles << organization.second_leader_title if organization == organization_second_led
    titles
  end
  

end
