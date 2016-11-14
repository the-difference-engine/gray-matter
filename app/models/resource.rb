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
  has_many :documents
  accepts_nested_attributes_for :documents

  #delete this below
  # has_attached_file :file_array
  # validates_attachment_content_type :file_array, :content_type => ['application/pdf']
end
