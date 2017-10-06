class CityCouncilPage < Fae::StaticPage

  @slug = 'city_council'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      description: { type: Fae::TextArea },
      meet_mayor: { type: Fae::TextArea },
      mayor_image: {type: Fae::Image}
    }
  end

end
