# == Schema Information
#
# Table name: admins
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  first_name    :string
#  last_name     :string
#  phone_number  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contact_email :string
#

class Admin < ActiveRecord::Base
  belongs_to :user
  has_one :profile
  accepts_nested_attributes_for :profile, allow_destroy: true

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
