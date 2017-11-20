class AddOrganizationIdToPublicNotices < ActiveRecord::Migration[5.0]
  def change
    add_reference :public_notices, :organization, foreign_key: true
  end
end
