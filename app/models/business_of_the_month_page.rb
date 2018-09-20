class BusinessOfTheMonthPage < Fae::StaticPage

  @slug = 'business_of_the_month'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      name: { type: Fae::TextField },
      url: { type: Fae::TextField },
      description: { type: Fae::TextArea },
      photo: { type: Fae::Image },
      photo_caption: { type: Fae::TextField },



    }
  end

end
