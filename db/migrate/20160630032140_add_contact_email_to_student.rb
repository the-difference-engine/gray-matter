class AddContactEmailToStudent < ActiveRecord::Migration
  def change
    add_column :students, :contact_email, :string
  end
end
