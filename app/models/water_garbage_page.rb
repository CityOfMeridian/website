class WaterGarbagePage < Fae::StaticPage

  @slug = 'water_garbage'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      content: { type: Fae::TextArea },
      image: { type: Fae::Image }
    }
  end

end
