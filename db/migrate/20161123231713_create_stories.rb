class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.string :url
      t.text :body

      t.timestamps null: false
    end
  end
end
