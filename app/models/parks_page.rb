class ParksPage < Fae::StaticPage

  @slug = 'parks'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      content: { type: Fae::TextArea }
    }
  end


  def content_text
    return content.content if content.present?
    nil
  end
end
