class AddPreviewTextToNewsItems < ActiveRecord::Migration[5.0]
  def change
    add_column :news_items, :preview_text, :string, limit: 100
  end
end
