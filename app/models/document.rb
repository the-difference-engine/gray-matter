class Document < ActiveRecord::Base
  belongs_to :resource
  belongs_to :announcement

  has_attached_file :file_array
  validates_attachment_content_type :file_array, :content_type => ['application/pdf']
end
