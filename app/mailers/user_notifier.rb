class UserNotifier < ApplicationMailer
  default :from => 'graymatter411@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user, password)
    @user = user
    @password = password
    mail( :to => @user.email,
          :subject => 'Thanks for signing up for our amazing app' )
  end
end
