class PublicNotice < ApplicationRecord
  include Fae::BaseModelConcern

  scope :active, -> { where('end_date > ?', Date.current).where('start_date > ?', 1.month.ago).all }

  def fae_display_field
    title
  end


  belongs_to :noticeable, polymorphic: true
end
