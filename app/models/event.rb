class Event < ApplicationRecord
  include Fae::BaseModelConcern

  attr_accessor :date_time

  before_create do
    self.date = Date.current if self.date.nil?
  end

  has_many :public_notices, as: :noticeable
  belongs_to :organization
  belongs_to :place

  scope :this_month, -> { where('extract(month from date) = ?', Date.current.month)}

  delegate :name, :address, to: :place, prefix: true

  def fae_display_field
    title
  end

  def abbreviated_month
    date.strftime("%b")
  end

  def day_date
    date.day
  end

  def time
    date.strftime("%l:%M%p")
  end


end
