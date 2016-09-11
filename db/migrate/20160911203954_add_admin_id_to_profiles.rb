class AddAdminIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :admin_id, :integer
  end
end
