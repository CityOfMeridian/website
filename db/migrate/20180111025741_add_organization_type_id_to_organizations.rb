class AddOrganizationTypeIdToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_reference :organizations, :organization_type, foreign_key: true
  end
end
