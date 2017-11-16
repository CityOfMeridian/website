class CreatePublicNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :public_notices do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :noticeable, polymorphic: true

      t.timestamps
    end
  end
end
