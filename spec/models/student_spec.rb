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
