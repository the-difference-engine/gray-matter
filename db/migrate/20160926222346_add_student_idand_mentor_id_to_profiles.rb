class AddStudentIdandMentorIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :student_id, :integer
    add_column :profiles, :mentor_id, :integer
  end
end
