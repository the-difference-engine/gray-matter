# == Schema Information
#
# Table name: events
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  start_time            :datetime
#  end_time              :datetime
#  all_day               :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  the_date              :datetime
#  event_date            :datetime
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#

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
