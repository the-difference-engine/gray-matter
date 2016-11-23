class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.integer :resource_id
      t.integer :announcemont_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
