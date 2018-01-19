class CreateMeridianTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :meridian_templates do |t|
      t.string :name
      t.timestamps
    end
  end
end
