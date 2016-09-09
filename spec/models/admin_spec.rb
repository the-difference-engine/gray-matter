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

require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  describe 'testing assocciations' do 
    it { should belong_to(:user) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

end
