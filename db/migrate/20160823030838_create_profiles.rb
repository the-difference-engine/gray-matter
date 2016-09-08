class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :body
      t.text :availability_array, array:true, default: []
      t.integer :student_id
      t.integer :mentor_id

      t.timestamps null: false
    end
  end
end
