class AddPlaceIdToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :place, foreign_key: true
  end
end
