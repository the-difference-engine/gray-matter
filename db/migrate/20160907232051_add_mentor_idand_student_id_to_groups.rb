class AddMentorIdandStudentIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :mentor_id, :integer
    add_column :groups, :student_id, :integer
  end
end
