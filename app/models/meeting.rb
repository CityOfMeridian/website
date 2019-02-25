class Meeting < ApplicationRecord
  include Fae::BaseModelConcern
  attr_accessor  :public_notice_title

  has_fae_file :agenda
  has_fae_file :minutes

  belongs_to :organization, touch: true
  belongs_to :place
  has_many :public_notices, as: :noticeable

  delegate :name, to: :place, prefix: true, allow_nil: true
  delegate :file_size, to: :agenda, prefix: true, allow_nil: true
  delegate :file_size, to: :minutes, prefix: true, allow_nil: true

  default_scope { order(:date) }

  scope :ordered, -> { reorder('date desc') }
  scope :this_year, -> { where('extract(year from date) = ?', Date.current.year) }
 
  scope :having_fileables, -> do
    joins('INNER JOIN fae_files ON fae_files.fileable_id = meetings.id AND fae_files.fileable_type = "Meeting"')
  end
 
  scope :having_minutes, -> do
    having_fileables
    .where('fae_files.attached_as = "minutes"')
    .where("fae_files.file_size IS NOT null")
  end

  scope :having_agenda, -> do
    having_fileables
    .where('fae_files.attached_as = "agenda"')
    .where("fae_files.file_size IS NOT null")
  end

  def self.delete_duplicates!
    Meeting.where.not(id: Meeting.having_minutes.select(:id)).where.not(id: Meeting.having_agenda.select(:id)).each do |meeting|
      if Meeting.where(date: meeting.date).count > 1                                                                                   
        meeting.destroy
      end
    end
  end

  def fae_nested_parent
    :organization
  end

  def fae_display_field
    title
  end

  def display_date
    date.strftime("%b. %e")
  end

  def agenda?
    agenda_file_size.present? ? "Yes" : "No"
  end

  def minutes?
    minutes_file_size.present? ? "Yes" : "No"
  end
end
