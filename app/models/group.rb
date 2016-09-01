# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  mentor_id  :integer
#  student_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :studnets
  has_one :mentor

end
