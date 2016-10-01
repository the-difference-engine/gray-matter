# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :announcement do
    title "MyString"
    user_id "MyString"
    body "MyString"
  end
end
