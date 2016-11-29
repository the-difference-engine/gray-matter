class Document < ActiveRecord::Base
  belongs_to :resource
  belongs_to :announcement
  belongs_to :event

  has_attached_file :file_array
  validates_attachment_content_type :file_array, :content_type => ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
end
