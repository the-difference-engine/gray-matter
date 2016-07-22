class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
