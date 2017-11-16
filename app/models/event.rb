class Event < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :public_notices, as: :noticeable

  def fae_display_field
    title
  end


end
