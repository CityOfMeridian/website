module PagesHelper
  def current_month_year
    Date.current.strftime("%B %Y")
  end
end
