# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    body "MyText"
    availability_array "MyText"
    user_id 1
  end
end
