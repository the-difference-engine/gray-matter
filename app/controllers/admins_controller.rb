class AdminsController < ApplicationController
  def index
   @admins = Admin.all
    render "index.html.erb"
 end

 def show
   @admin = Admin.find_by(id: params[:id])
   render "show.html.erb"
 end

 def create
   @admin = Admin.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      contact_email: params[:contact_email],
      phone_number: params[:phone_number])
   redirect_to "index.html.erb"
 end

 def destroy
   @admin = Admin.find_by(id: params[:id])
   @admin.destroy
   redirect_to "/admins"
 end
end


