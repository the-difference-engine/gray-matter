class MembersController < ApplicationController
  include UsersHelper

  def add_member
    # TODO I do not like this logic here the generate password
    password = generate_password
    params[:password] = password
    params[:password_confirmation] = password
    # TODO add the sending of the email
    if @user = User.create(member_params)
      redirect_to admin_path
      flash[:success] = "A New #{@user.role} has been added"
    else
      flash[:error] = "Something went wrong"
    end
    # TODO need to add the method to generate the random password after the email service is set upo
    # TODO not sure the way I am geneating passwords is the best look this up
  end

  private

  def member_params
    params.permit(:email, :role, :password, :password_confirmation)
  end

end
