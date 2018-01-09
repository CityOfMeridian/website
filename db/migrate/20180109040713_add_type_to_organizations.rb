class AddTypeToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :type, :string
  end
end
