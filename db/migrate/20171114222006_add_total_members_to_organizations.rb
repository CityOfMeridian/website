class AddTotalMembersToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :total_members, :integer
  end
end
