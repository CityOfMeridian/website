class CreateFaeStaticPagesOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :fae_static_pages_organizations do |t|
      t.integer :fae_static_page_id
      t.integer :organization_id
    end
  end
end
