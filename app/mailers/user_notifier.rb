class UserNotifier < ApplicationMailer
  default :from => 'graymatter411@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user, password)

    @host_url = ENV['HOST_URL']
    @user = user
    @password = password
    mail( :to => @user.email,
          :subject => 'Welcome to Gray Matter' )
  end
end
