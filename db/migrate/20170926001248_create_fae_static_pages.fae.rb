# This migration comes from fae (originally 20141021184311)
class CreateFaeStaticPages < ActiveRecord::Migration
  def change
    create_table :fae_static_pages do |t|
      t.string :title
      t.integer :position, default: 0
      t.boolean :on_stage, default: true
      t.boolean :on_prod, default: false
      t.string :slug, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
