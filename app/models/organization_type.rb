class OrganizationType < ApplicationRecord
  include Fae::BaseModelConcern

  def fae_display_field
    name
  end


  class << self
    def community
      self.where(name: "Community").first
    end

    def for_fae_index
      order(:name)
    end
  end
end
