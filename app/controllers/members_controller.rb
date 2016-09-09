class MembersController < ApplicationController
  include UsersHelper

  def add_member
    # TODO I do not like this logic here the generate password
    password = generate_password
    puts "* " * 50
    puts password
    puts "* " * 50
    params[:password] = password
    params[:password_confirmation] = password
    # TODO add the sending of the email
    @user = User.new(member_params)
    if @user.save
      redirect_to admins_path
      flash[:success] = "A New #{@user.role} has been added"
    else
      flash[:error] = "Something went wrong"
    end
    # if @user.mentor?
# TODO need to set this up so the admin can create the group
    # end
  end

  private

  def member_params
    params.permit(:email, :role, :password, :password_confirmation)
  end

end
