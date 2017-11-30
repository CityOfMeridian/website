class AddDateToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :date, :datetime
    add_reference :events, :place
  end
end
