class Meeting < ApplicationRecord
  include Fae::BaseModelConcern
  attr_accessor  :public_notice_title

  has_fae_file :agenda
  has_fae_file :minutes

  belongs_to :organization, touch: true
  belongs_to :place
  has_many :public_notices, as: :noticeable

  delegate :name, to: :place, prefix: true, allow_nil: true

  default_scope { order(:date) }

  scope :ordered, -> { order('date desc') }

  def fae_nested_parent
    :organization
  end

  def fae_display_field
    title
  end

  def display_date
    pretty_date(date)
  end
end
