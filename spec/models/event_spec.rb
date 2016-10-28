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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
