class Organization < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :meetings

  def fae_display_field
    name
  end


end
