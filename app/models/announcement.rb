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

class Announcement < ActiveRecord::Base
  belongs_to :user
  has_many :documents
  accepts_nested_attributes_for :documents
end
