class MentorsController < ApplicationController
  # before_action :restrict_access

 def index
   @groups = Group.all
   @mentors = Mentor.all
   @page_title = current_user.page_title
   @home_url = "/#{current_user.role}"
   @profile_url = "/mentors/#{current_user.id}" #this needs to change, see admin current_user.role
   @group_url = "/groups/#{@groups.name}"
 end

 def show
   @mentor = Mentor.new
   @profile = Profile.new
   # @mentor_profile = current_user.profile
# move all this to the profile controller
   # if @mentor_profile.nil?
   #   @mentor_profile = Profile.new
   #   @mentor_profile.save
   #   @create_profile = true
   # end
   @page_title = current_user.page_title
   @page_url = mentor_path
   @profile_url = new_mentor_path
 end

 def new
   @mentor = Mentor.new
   @mentor.build_profile
   @page_title = 'Create My Profile'
   @page_url = '/'
   @profile_url = '/'
 end

 def create
   binding.pry
   params[:user_id] = current_user.id
   @mentor = Mentor.new(mentor_params)
   if @mentor.save
     redirect_to "/mentors/#{current_user.id}"
    flash[:success] = "A New Mentor has been added"
   else
     flash[:error] = "Something went wrong"
   end
 end

 def destroy
   # @mentor = Mentor.find_by(id: params[:id])
   @admin.destroy
   redirect_to "/mentors"
 end

 private

 def mentor_params
   params.require(:mentor).permit(:company, :industry, :website, :first_name, :last_name, :phone_number, :user_id, profile_attributes: [:body])
 end

 # def restrict_access
 #   if current_user.role != 'mentor'
 #     flash[:success] = "You do not have access to this page"
 #     redirect_to '/'
 #   end
 # end

end
