class Meeting < ApplicationRecord
  include Fae::BaseModelConcern

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
