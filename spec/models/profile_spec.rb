require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }
  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:availability_array).of_type(:text) }
  it { should have_db_column(:user_id).of_type(:integer) }
end
