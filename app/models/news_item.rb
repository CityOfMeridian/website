class NewsItem < ApplicationRecord
  include Fae::BaseModelConcern
  has_many :public_notices, as: :noticeable

  def fae_display_field
    title
  end

  has_fae_image :image


end
