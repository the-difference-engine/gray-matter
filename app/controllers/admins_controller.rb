class AdminsController < ApplicationController
  before_filter :authenticate_user!
  before_action :restrict_access
# TODO what happens if the user is NOT authenticated? ** this is good just change the flash message no sign up - and also make it fancey

# TODO only admins can create anyone!
  # TODO add redirect for restirict_access

  
  def index
    @admins = User.where("role": 'admins')
    @students = User.where("role": 'students')
    @mentors = User.where("role": 'mentors')
    @groups = Group.all
    @home_url = authenticated_root_path
    @group_url = "/groups/#{@groups.name}"
    @profile_url = "/profiles/#{current_user.id}"
    @page_title = current_user.role.capitalize
 end

 # def show
 #   @admin = Admin.find_by(id: params[:id])
 #   render "show.html.erb"
 # end

 # def create
   # TODO we can not just create a admin, they have to be tighed to a user.. so create the user first then create the admin second - perfect for sereilizer?? on create check to see if the user alrady exists see destroy below

# TODO only admins can create anyone!

# TODO now that I think about this, maybe the admin only creats the user, email that's it, then when the user logs in changes password etc, they fill their on whit out?
   # @admin = Admin.create(
   #    first_name: params[:first_name],
   #    last_name: params[:last_name],
   #    contact_email: params[:contact_email],
   #    phone_number: params[:phone_number])
   # redirect_to "index.html.erb"
 # end


 def destroy
   # TODO never destroy the user only the admin (or student or mentor)
   if current_user.id == params[:id].to_i
     flash[:danger] = "You can not delete yourself"
   else
     admin = Admin.find_by_id(params[:id])
   end
   # admin.destroy
   redirect_to "/admins"
 end
 private

 # TODO need to un-comment this above at the head this throws an error
 def restrict_access
   if !current_user.admin?
     flash[:success] = "You do not have access to this page"
     redirect_to '/'
   end
 end

end


