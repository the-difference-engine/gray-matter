class Group < ActiveRecord::Base
  has_many :studnets
  has_one :mentor

end
