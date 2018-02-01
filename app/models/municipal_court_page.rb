class MunicipalCourtPage < Fae::StaticPage

  @slug = 'municipal_court'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      main_content: { type: Fae::TextArea },
      subfield_1: { type: Fae::TextArea },
      subfield_2: { type: Fae::TextArea },
      subfield_3: { type: Fae::TextArea }
    }
  end

end
