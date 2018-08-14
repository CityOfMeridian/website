class AddDatesToNewItems < ActiveRecord::Migration[5.0]
  def change
    add_column :news_items, :start_date, :date
    add_column :news_items, :end_date, :date
  end
end
