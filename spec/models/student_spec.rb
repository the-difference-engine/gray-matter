# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  school        :string
#  grade         :string
#  gender        :string
#  first_name    :string
#  last_name     :string
#  phone_number  :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contact_email :string
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  
  describe 'testing assocciations and attribute types' do 
    it { should belong_to(:user) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:school).of_type(:string) }
    it { should have_db_column(:grade).of_type(:string) }
    it { should have_db_column(:gender).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end 
  
  

end
