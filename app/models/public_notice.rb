class PublicNotice < ApplicationRecord
  include Fae::BaseModelConcern

  NOTICEABLE_TYPES = %w(Meeting Event NewsItem).freeze

  belongs_to :organization
  belongs_to :noticeable, polymorphic: true

  scope :active, -> { where('end_date > ?', Date.current).where('start_date > ?', 1.month.ago).all }
  scope :meetings, -> { where(noticeable_type: 'Meeting') }
  scope :events, -> { where(noticeable_type: 'Event') }
  scope :news_items, -> { where(noticeable_type: 'NewsItem') }

  delegate :title, to: :meeting, prefix: true
  delegate :title, to: :event, prefix: true
  delegate :news_item, to: :event, prefix: true
  delegate :name, to: :organization, prefix: true

  def fae_display_field
    title
  end




end
