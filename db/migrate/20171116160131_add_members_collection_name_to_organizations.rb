class AddMembersCollectionNameToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :members_collection_name, :string
  end
end
