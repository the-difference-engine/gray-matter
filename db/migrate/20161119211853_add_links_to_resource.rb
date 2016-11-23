class AddLinksToResource < ActiveRecord::Migration
  def change
    add_column :resources, :links, :text, array:true, default: []
  end
end
