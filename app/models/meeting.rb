class Meeting < ApplicationRecord
  include Fae::BaseModelConcern

  has_fae_file :agenda
  has_fae_file :minutes

  belongs_to :organization, touch: true
  belongs_to :place

  default_scope { order(:date) }

  def fae_nested_parent
    :organization
  end

  def fae_display_field
    title
  end



end
