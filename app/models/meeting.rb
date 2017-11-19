class Meeting < ApplicationRecord
  include Fae::BaseModelConcern
  attr_accessor :create_public_notice

  before_save :create_public_notice

  has_fae_file :agenda
  has_fae_file :minutes

  belongs_to :organization, touch: true
  belongs_to :place
  has_many :public_notices, as: :noticeable

  delegate :name, to: :place, prefix: true, allow_nil: true

  default_scope { order(:date) }

  def fae_nested_parent
    :organization
  end

  def fae_display_field
    title
  end

  def ordered
    order(:date)
  end

  def create_public_notice
    PublicNotice.create(title: title, noticeable: self, start_date: Date.current, end_date: self.date)
  end
end
