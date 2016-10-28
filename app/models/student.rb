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
  has_many :notes
  accepts_nested_attributes_for :profile, allow_destroy: true
  validates_presence_of :school, :grade, :gender, :first_name, :last_name

  validates :phone_number, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
