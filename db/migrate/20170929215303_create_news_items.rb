class CreateNewsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :content
      t.boolean :approved
      t.references :organization

      t.timestamps
    end
  end  
end
