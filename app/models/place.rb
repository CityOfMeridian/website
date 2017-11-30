class Place < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :meetings
  has_many :events

  def fae_display_field
    name
  end


end
