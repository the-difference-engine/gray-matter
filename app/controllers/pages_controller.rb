class PagesController < ApplicationController
  before_filter :authenticate_user!

  # def home 
  #   if !current_user 
  #     redirect_to "/users/sign_in"
  #   elsif current_user.role == "admin"
  #     @user = current_user
  #     render "admin.html.erb"
  #   elsif current_user.role == "student"
  #     @user = current_user 
  #     render "student.html.erb"
  #   else
  #     @user = current_user
  #     render "mentor.html.erb"
  #   end
  # end
end
