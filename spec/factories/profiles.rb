# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  body                :text
#  availability_array  :text             default([]), is an Array
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  admin_id            :integer
#  student_id          :integer
#  mentor_id           :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    body "MyText"
    availability_array "MyText"
    user_id 1
  end
end
