class PagesController < ApplicationController

  def home 
    
    if current_user.role == "student" 
      render "student.html.erb"
    elsif current_user.role == "admin"
      @user = current_user
      render "admin.html.erb"
    elsif current_user.role == "mentor"
      @user = current_user
      render "mentor.html.erb"
    else 
      redirect_to "/users/sign_in"
    end
  end


end
