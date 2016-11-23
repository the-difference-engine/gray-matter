class AddLinksToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :links, :text, array:true, default: []
  end
end
