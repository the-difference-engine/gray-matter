class AddLinksToEvents < ActiveRecord::Migration
  def change
    add_column :events, :links, :text, array:true, default: []
  end
end
