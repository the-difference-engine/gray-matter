# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    start_time "2016-10-09 08:47:21"
    end_time "2016-10-09 08:47:21"
    all_day false
  end
end
