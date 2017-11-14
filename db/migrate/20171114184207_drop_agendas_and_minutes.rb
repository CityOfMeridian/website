class DropAgendasAndMinutes < ActiveRecord::Migration[5.0]
  def change
    drop_table(:agendas)
    drop_table(:minutes)
  end
end
