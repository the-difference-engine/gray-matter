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

require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }
  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:availability_array).of_type(:text) }
  it { should have_db_column(:user_id).of_type(:integer) }
end
