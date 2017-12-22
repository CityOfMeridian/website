class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def pretty_date(date)
    date.strftime("%b. %e, %Y")
  end

end
