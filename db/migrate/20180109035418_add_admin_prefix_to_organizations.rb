class AddAdminPrefixToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :admin_prefix, :string
  end
end
