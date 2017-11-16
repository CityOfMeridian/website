class Organization < ApplicationRecord
  include Fae::BaseModelConcern

  EXPECTED_LEADER_TITLES = %w(mayor mayor_pro_tem).freeze
  has_many :roles
  has_many :meetings
  has_many :members
  belongs_to :leader, class_name: 'Member'
  belongs_to :second_leader, class_name: 'Member'

  def fae_display_field
    name
  end

  def leader_titles
    [leader_title, second_leader_title]
  end

end
