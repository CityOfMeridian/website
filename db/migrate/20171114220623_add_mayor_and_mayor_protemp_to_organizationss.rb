class AddMayorAndMayorProtempToOrganizationss < ActiveRecord::Migration[5.0]
  def change
    add_reference :organizations, :leader, references: :members
    add_column :organizations, :leader_title, :string, default: 'mayor'
    add_reference :organizations, :second_leader, references: :members
    add_column :organizations, :second_leader_title, :string, default: 'mayor_pro_tem'
  end
end
