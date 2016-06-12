class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    render 'role_template'
  end

  #Differentiate type of user in users table for student and mentor?#
end
