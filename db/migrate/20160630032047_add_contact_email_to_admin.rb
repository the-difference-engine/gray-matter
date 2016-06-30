class AddContactEmailToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :contact_email, :string
  end
end
