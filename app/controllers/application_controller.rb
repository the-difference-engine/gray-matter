class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def first_logged_in?
    if !current_user.has_logged_in
      redirect_to change_password_path 
    end
  end
end

