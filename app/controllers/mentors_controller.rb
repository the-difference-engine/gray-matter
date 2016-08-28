class MentorsController < ApplicationController
  # before_action :restrict_access

 def index
   @page_title = current_user.page_title
   @home_url = "/#{current_user.role}"
   @profile_url = "/mentors/#{current_user.id}" #this needs to change, see admin current_user.role
   @mentors = Mentor.all
 end

 def show
   @mentor_profile = current_user.profile
# move all this to the profile controller
   if @mentor_profile.nil?
     @mentor_profile = Profile.new
     @mentor_profile.save
     @create_profile = true
   end
   
   @page_title = current_user.page_title
   @page_url = mentors_path
   @profile_url = mentors_path
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

 # def restrict_access
 #   if current_user.role != 'mentor'
 #     flash[:success] = "You do not have access to this page"
 #     redirect_to '/'
 #   end
 # end

end
