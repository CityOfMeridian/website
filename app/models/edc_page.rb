class EdcPage < Fae::StaticPage

  @slug = 'edc'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      content: { type: Fae::TextArea }
    }
  end

end
