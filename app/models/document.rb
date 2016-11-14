class Document < ActiveRecord::Base
  belongs_to :resource

  has_attached_file :file_array
  validates_attachment_content_type :file_array, :content_type => ['application/pdf']
end
