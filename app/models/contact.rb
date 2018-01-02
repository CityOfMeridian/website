class Contact < ApplicationRecord
  include Fae::BaseModelConcern

  scope :water_garbage, -> { where(contact_type: 'water_garbage').order(:created_at) }
  scope :parks, -> { where(contact_type: 'parks').order(:created_at) }

  validates :email, presence: true, 
    unless: Proc.new { |a| a.phone.present? } 

  validates :phone, presence: true, 
    unless: Proc.new { |a| a.email.present? }
  
  def fae_display_field
    name
  end
 
end
