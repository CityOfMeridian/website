class Event < ApplicationRecord
  include Fae::BaseModelConcern

  attr_accessor :date_time

  before_create do
    self.date = Date.current if self.date.nil?
  end

  has_many :public_notices, as: :noticeable
  belongs_to :organization
  belongs_to :place

  scope :in_same_month_as, -> (date) { 
    where('extract(month from date) = ?', date.month).
    where('extract(year from date) = ?', date.year) 
  }

  scope :coming_soon, -> { 
    where("date >= ?", Date.current)
  }

  scope :recent, -> (num=3){
    order(:date).limit(num)
  }
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

  def display_date
    pretty_date(date)
  end
end
