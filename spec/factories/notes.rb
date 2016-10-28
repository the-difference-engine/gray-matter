# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    title "MyString"
    note "MyText"
    student_id 1
  end
end
