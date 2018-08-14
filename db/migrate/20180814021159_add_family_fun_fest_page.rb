class AddFamilyFunFestPage < ActiveRecord::Migration[5.0]
  def up
    Fae::StaticPage.create(title: "Family Fun Fest", slug: "family_fun_fest", page_class_name: "FamilyFunFest")
  end

  def down
    Fae::StaticPage.find_by(title: "Family Fun Fest").delete
  end
end
