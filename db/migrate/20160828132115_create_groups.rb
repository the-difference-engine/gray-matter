class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :mentor_id
      t.integer :student_id
      t.string :name

      t.timestamps null: false
    end
  end
end
