class MembersController < ApplicationController
  include UsersHelper

  def add_member
    password = generate_password
    params[:password] = password
    params[:password_confirmation] = password
    @user = User.new(member_params)
    if !email_exists?(params[:email])
      if @user.save
        create_profile(@user)
        UserNotifier.send_signup_email(@user, password).deliver_now
        redirect_to admins_path
        flash[:success] = "A New #{@user.role} has been added"
      else
        redirect_to admins_path
        flash[:danger] = "Something went wrong"
      end
    else
      redirect_to admins_path
      flash[:danger] = "#{params[:email]} already exists"
    end
  end

  private
# TODO change page_title to display_role or something
  def create_profile(user)
    user.page_title.constantize.create(user_id: user.id)
  end

  def member_params
    params.permit(:email, :role, :password, :password_confirmation)
  end

end
