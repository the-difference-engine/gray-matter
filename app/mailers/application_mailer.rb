class ApplicationMailer < ActionMailer::Base
  add_template_helper(EmailsHelper)
  default from: "from@example.com"
  layout 'mailer'
end
