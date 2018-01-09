class AddStaticPageIdToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_reference :organizations, :fae_static_page
  end
end
