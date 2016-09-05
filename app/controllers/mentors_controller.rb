class MentorsController < ApplicationController
  # before_action :restrict_access

 def index
   @mentor = Mentor.new
   @groups = Group.all
   @mentors = Mentor.all
   @page_title = current_user.page_title
   @home_url = "/#{current_user.role}"
   @profile_url = "/mentor/#{current_user.id}" #this needs to change, see admin current_user.role
   @group_url = "/groups/#{@groups.name}"
 end

 def show
   @mentor = Mentor.new

   @profile = Profile.new

   @create_profile = true
   @page_title = current_user.page_title
   @page_url = mentor_path
   @profile_url = mentor_path
 end

 def new
   binding.pry
   @testing = 'did this print fucker face'
   @mentor = Mentor.new
   @profile = Profile.new
 end

 def create
   params[:user_id] = current_user.id
# set up payload??
   if @mentor = Mentor.create(mentor_params)
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
   params.require(:mentor).permit(:company, :industry, :website, :first_name, :last_name, :phone_number, :user_id,
                                  profile_attributes: [:body,
                                                       :mentor_id
                                       ])
 end

 # def restrict_access
 #   if current_user.role != 'mentor'
 #     flash[:success] = "You do not have access to this page"
 #     redirect_to '/'
 #   end
 # end

end
