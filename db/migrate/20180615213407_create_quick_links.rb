class CreateQuickLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :quick_links do |t|
      t.string :text
      t.string :url
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
