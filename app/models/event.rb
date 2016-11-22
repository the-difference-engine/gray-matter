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

class Event < ActiveRecord::Base
  has_many :documents
  accepts_nested_attributes_for :documents
end
