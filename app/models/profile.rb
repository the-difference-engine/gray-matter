# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  body               :text
#  availability_array :text             default([]), is an Array
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Profile < ActiveRecord::Base
  belongs_to :user
end
