class MentorsController < ApplicationController
  before_action :restrict_access

 def index
   @mentors = Mentor.all
   render "index.html.erb"
 end

 def show
   # @mentor = Mentor.find_by(id: params[:id])
   render "show.html.erb"
 end

 def create
   @mentor = Mentor.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      contact_email: params[:contact_email],
      phone_number: params[:phone_number])
   redirect_to "index.html.erb"
 end

 def destroy
   # @mentor = Mentor.find_by(id: params[:id])
   @admin.destroy
   redirect_to "/mentors"
 end

 private

 def restrict_access
   if current_user.role != 'mentor'
     flash[:success] = "You do not have access to this page"
     redirect_to '/'
   end
 end

end
