class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name

      t.timestamps
    end

    add_reference :fae_roles, :organization
  end
end
