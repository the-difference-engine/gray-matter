class ChangepasswordsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
    @home_url = authenticated_root_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Change Password'
  end

  def update_password
    @page_title = 'Error'
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      redirect_to authenticated_root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
