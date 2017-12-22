class AddDefaultMemberTitleToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :default_member_title, :string
  end
end
