# == Schema Information
#
# Table name: mentors
#
#  id            :integer          not null, primary key
#  company       :string
#  industry      :string
#  website       :string
#  first_name    :string
#  last_name     :string
#  phone_number  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  contact_email :string
#

class Mentor < ActiveRecord::Base
  belongs_to :user
  has_one :profile
  has_one :group
  accepts_nested_attributes_for :profile, allow_destroy: true

  validates_presence_of :company, :industry, :website, :first_name, :last_name 
  validates :phone_number, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
