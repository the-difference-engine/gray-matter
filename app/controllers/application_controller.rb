class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private

  def role_template
    user_role = current_user.has_role? :admin ? 'mentor' : 'student'
    "#{user_role}_#{action_name}"
  end
end
