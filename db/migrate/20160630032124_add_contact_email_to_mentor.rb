class AddContactEmailToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :contact_email, :string
  end
end
