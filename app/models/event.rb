# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  start_time  :datetime
#  end_time    :datetime
#  all_day     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ['application/pdf']
end
