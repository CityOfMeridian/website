class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.datetime :date
      t.references :organization, foreign_key: true
      t.references :place

      t.timestamps
    end
  end
end
