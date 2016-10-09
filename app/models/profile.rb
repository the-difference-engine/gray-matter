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

class Profile < ActiveRecord::Base
  has_attached_file :avatar,
                    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
                    
                    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
                    # validates_attachment :photo, :size => { :in => 0..4.megabytes }
                    # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
