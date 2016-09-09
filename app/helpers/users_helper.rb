module UsersHelper
  require 'securerandom'

  def generate_password
    return SecureRandom.hex(4)
  end
end
