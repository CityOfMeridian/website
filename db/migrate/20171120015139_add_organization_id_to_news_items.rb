class AddOrganizationIdToNewsItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :news_items, :organization, foreign_key: true
  end
end
