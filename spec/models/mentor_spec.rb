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

require 'rails_helper'

RSpec.describe Mentor, type: :model do
  
  describe 'testing assocciations and attribute types' do
    it { should belong_to(:user) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:company).of_type(:string) }
    it { should have_db_column(:industry).of_type(:string) }
    it { should have_db_column(:website).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end
end
