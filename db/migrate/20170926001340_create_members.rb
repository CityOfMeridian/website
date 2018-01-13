class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.text :description
      t.string :email
      t.datetime :term_start
      t.datetime :term_end
      t.boolean :active, default: false
      t.references :organization

      t.timestamps
    end
  end
end
