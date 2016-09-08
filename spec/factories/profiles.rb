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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    body "MyText"
    availability_array "MyText"
    user_id 1
  end
end