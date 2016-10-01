module UsersHelper
  require 'securerandom'

  def generate_password
    return SecureRandom.hex(4)
  end

  def email_exists?(email)
    User.find_by_email(email).present?
  end

end
