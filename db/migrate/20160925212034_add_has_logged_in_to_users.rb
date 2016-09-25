class AddHasLoggedInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_logged_in, :boolean, :default => false
  end
end
