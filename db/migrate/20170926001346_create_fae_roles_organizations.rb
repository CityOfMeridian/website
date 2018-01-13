class CreateFaeRolesOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :fae_roles_organizations do |t|
      t.integer :fae_role_id
      t.integer :organization_id
    end
  end
end
