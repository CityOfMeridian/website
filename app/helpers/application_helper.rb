module ApplicationHelper

  def generate_tooltip_content(event)
    html = ""
    html += "<dt>Time</dt><dd>#{event.time}</dd>" if event.time.present?
    html += "<dt>Place</dt><dd>#{event.place}</dd>" if event.place.present?
    html += "</dl>"
    html
  end

end
