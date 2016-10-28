class AddTheDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :the_date, :datetime
  end
end
