class RemoveStudentIdandMentorIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :student_id, :integer
    remove_column :users, :mentor_id, :integer
  end
end
