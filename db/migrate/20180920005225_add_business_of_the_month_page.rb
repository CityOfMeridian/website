class AddBusinessOfTheMonthPage < ActiveRecord::Migration[5.0]
  def up
    Fae::StaticPage.create(title: "Business of the Month", slug: "business_of_the_month", page_class_name: "BusinessOfTheMonth")
  end

  def down
    Fae::StaticPage.find_by(slug: "business_of_the_month").delete
  end
end
