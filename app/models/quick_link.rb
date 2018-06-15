class QuickLink < ApplicationRecord
  include Fae::BaseModelConcern
  scope :active, -> () { where(active: true) }

  def fae_display_field
    text
  end

  def self.for_fae_index
    order(:created_at)
  end
end
