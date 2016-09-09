class RemoveMentorIdandStudentIdFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :mentor_id, :integer
    remove_column :groups, :student_id, :integer
  end
end
