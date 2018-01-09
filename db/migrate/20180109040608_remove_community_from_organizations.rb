class RemoveCommunityFromOrganizations < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :community
  end
end
