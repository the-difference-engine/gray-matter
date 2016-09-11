class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # protected

  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role, :email, :password) }
  #     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:role, :email, :password, :current_password) }
  #   end

  def after_sign_in_path_for(resource)
    if current_user.role.present?
      if current_user.role == 'students'
        authenticated_root_path
      elsif current_user.role == 'mentors'
        authenticated_root_path
      elsif current_user.role == 'admins'
        admins_path
      end
    else
      # route back to sign up with an flash alert
    end
  end
end

