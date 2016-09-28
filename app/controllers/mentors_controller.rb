class MentorsController < ApplicationController
  before_filter :authenticate_user!
  # before_action :restrict_access - everyone has access to this controller

 def index
   @groups = Group.all
   @mentors = Mentor.all
   @profiles = Profile.all
   @home_url = authenticated_root_path
   @profile_url = "#{current_user.role}/#{current_user.id}" 
   @group_url = "/groups/#{@groups.name}"
   @page_title = current_user.role.capitalize
 end

 def show
   @mentor = Mentor.find_by_user_id(params[:id])
   # @groups = [current_user.group]
   if @mentor.nil?
     redirect_to new_mentor_path
   else
     @profile_url = "#{current_user.id}"
   end
   @home_url = authenticated_root_path
   @page_url = mentor_path
   @page_title = current_user.role.capitalize
 end

 def new
   @mentor = Mentor.new
   @mentor.build_profile
   @page_title = 'Create My Profile'
   @home_url = authenticated_root_path
   @profile_url = "#{current_user.id}"
 end

 def create
   params[:mentor][:user_id] = current_user.id
   params[:mentor][:contact_email] = current_user.email
   @mentor = Mentor.new(mentor_params)
   
   if @mentor.save
     redirect_to "/mentors/#{current_user.id}"
     flash[:success] = "Your profile has been created"
   else
     flash[:error] = "Something went wrong"
     render 'new'
   end
 end

 def edit
# TODO needs to be able to edit group
   @mentor = Mentor.find_by_user_id(params[:id])
   @home_url = "#{current_user.role}"
   @profile_url = "#{current_user.role}/#{current_user.id}" 
   @page_title = 'Edit Profile'
 end

 def update
   
   params[:mentor][:user_id] = current_user.id
   @mentor = Mentor.find_by_user_id(params[:mentor][:user_id])

   #paperclip below
   # if params[:mentor][:image].blank?
   #   @mentor.image = nil
   # end

   if @mentor.update(mentor_params)
     flash[:success] = 'Profile Updated'
     redirect_to "/mentors/#{current_user.id}"
   else
     render 'new'
   end
 end

 def destroy
   user = User.find_by_id(params[:id])
   mentor = Mentor.find_by_user_id(params[:id])

   if mentor.present?
     mentor.destroy
   end
   
   if user.destroy
     flash[:success] = 'Mentor Removed'
     redirect_to admins_path
   else
     flash[:error] = 'Mentor was NOT Removed'
     redirect_to admins_path
   end
 end

 private

 def mentor_params
   params.require(:mentor).permit(:company, :industry, :website, :first_name, :last_name, :phone_number, :contact_email, :user_id, profile_attributes: [:id, :body, :avatar_file_name, :avatar_content_type, :mentor_id, :_destroy])
 end

 # def restrict_access
 #   if current_user.role != 'mentor'
 #     flash[:success] = "You do not have access to this page"
 #     redirect_to '/'
 #   end
 # end

end
