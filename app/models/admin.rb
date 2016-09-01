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

end
