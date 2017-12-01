class Event < ApplicationRecord
  include Fae::BaseModelConcern

  before_create do
    self.date = Date.current
  end

  has_many :public_notices, as: :noticeable
  belongs_to :organization
  belongs_to :place

  delegate :name, :address, to: :place, prefix: true

  def fae_display_field
    title
  end

end
