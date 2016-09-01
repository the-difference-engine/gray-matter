# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  school        :string
#  grade         :string
#  gender        :string
#  first_name    :string
#  last_name     :string
#  phone_number  :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contact_email :string
#

class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

end
