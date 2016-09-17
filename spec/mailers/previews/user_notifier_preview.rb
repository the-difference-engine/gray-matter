# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  def send_signup_email
    password = '23453a3d3'
    UserNotifier.send_signup_email(User.last, password)
  end
end
