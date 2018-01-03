class VisitPage < Fae::StaticPage

  @slug = 'visit'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      banner_image: { type: Fae::Image },
      section_1_name: { type: Fae::TextField },
      section_1: { type: Fae::TextArea },
      section_2_name: { type: Fae::TextField },
      section_2: { type: Fae::TextArea },
      section_3_name: { type: Fae::TextField },
      section_3: { type: Fae::TextArea },
      section_4_name: { type: Fae::TextField },
      section_4: { type: Fae::TextArea }
    }
  end

end
