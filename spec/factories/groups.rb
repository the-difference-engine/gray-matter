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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    mentor_id 1
    student_id 1
    name "MyString"
  end
end
