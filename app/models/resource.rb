# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  title       :string
#  link        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Resource < ActiveRecord::Base
  belongs_to :user

  has_attached_file :document
  validates_attachment_content_type :document, :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)
end
