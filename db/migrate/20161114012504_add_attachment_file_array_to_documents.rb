class AddAttachmentFileArrayToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :file_array
    end
  end

  def self.down
    remove_attachment :documents, :file_array
  end
end
