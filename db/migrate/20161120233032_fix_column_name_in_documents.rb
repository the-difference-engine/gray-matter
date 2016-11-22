class FixColumnNameInDocuments < ActiveRecord::Migration
  def change
    rename_column :documents, :announcemont_id, :announcement_id
  end
end

