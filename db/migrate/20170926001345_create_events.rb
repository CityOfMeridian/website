class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :message
      t.datetime :date
      t.boolean :approved
      t.references :organization
      t.references :place

      t.timestamps
    end
  end
end
