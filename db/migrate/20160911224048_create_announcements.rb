class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
