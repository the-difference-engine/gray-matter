# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  body               :text
#  availability_array :text             default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  student_id         :integer
#  mentor_id          :integer
#

class Profile < ActiveRecord::Base
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }, default_url: "http://simplerev.com/wp-content/uploads/Generic-Avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
