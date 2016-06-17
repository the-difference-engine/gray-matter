class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :school
      t.string :grade
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
