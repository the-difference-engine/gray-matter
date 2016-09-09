# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  body               :text
#  availability_array :text             default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  student_id         :integer
#  mentor_id          :integer
#

class Profile < ActiveRecord::Base
end
