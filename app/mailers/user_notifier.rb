class UserNotifier < ApplicationMailer
  default :from => 'graymatter411@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user, password)
    # attachments.inline['gray_brain.png'] = File.read('app/assets/images/gray_brain.png')
    @host_url = ENV['HOST_URL']
    @logo = 'gray_brain.png'
    @user = user
    @password = password
    mail( :to => @user.email,
          :subject => 'Welcome to Gray Matter' )
  end
end
