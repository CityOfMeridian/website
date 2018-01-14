class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :leader_title,  default: 'mayor'
      t.string :second_leader_title,  default: 'mayor pro tem'
      t.string :members_collection_name, default: 'City Council'
      t.string :default_member_title, default: 'Council Member'
      t.string :website
      t.string :admin_prefix

      t.timestamps
    end

    add_reference :organizations, :leader, references: :members
    add_reference :organizations, :second_leader, references: :members
    add_reference :organizations, :organization_type

  end
end
