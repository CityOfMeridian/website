class AddCommunityToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :community, :boolean
  end
end
