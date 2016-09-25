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
  has_one :profile
  has_one :group
  accepts_nested_attributes_for :profile, allow_destroy: true

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
