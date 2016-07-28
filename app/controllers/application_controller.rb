class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.role.present?
      if current_user.role == 'student'
        students_path
      elsif current_user.role == 'mentors'
        mentors_path
      else
        admins_path
      end
    else
      # route back to sign up with an flash alert
    end
  end
end
