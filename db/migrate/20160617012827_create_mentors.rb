class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :company
      t.string :industry
      t.string :website
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
