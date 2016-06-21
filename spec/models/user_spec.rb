require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'testing assocciations' do 
   
    it { should have_db_column(:role).of_type(:string) }

  end
end
