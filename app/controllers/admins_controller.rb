class AdminsController < ApplicationController
  before_filter :authenticate_user!
  before_action :restrict_access
# TODO what happens if the user is NOT authenticated? ** this is good just change the flash message no sign up - and also make it fancey

# TODO only admins can create anyone!
  # TODO add redirect for restirict_access

  
  def index
    @admins = User.where("role": 'admins').order('created_at DESC')
    @students = User.where("role": 'students').order('created_at DESC')
    @mentors = User.where("role": 'mentors').order('created_at DESC')
    @groups = Group.all
    @home_url = authenticated_root_path
    @group_url = "/groups/#{@groups.name}"
    @profile_url = "/admins/#{current_user.id}"
    @page_title = current_user.role.capitalize
    @announcement = Announcement.new #do I really need this?
 end

  def show
    @admin = Admin.find_by_user_id(params[:id])
    # @groups = [current_user.group]
    if @admin.nil?
      redirect_to new_admin_path
    end
    if @admin.nil?
      @profile_url = new_admin_path
    else
      @profile_url = "#{current_user.id}"
    end
    @home_url = authenticated_root_path
    @page_url = admin_path
    @page_title = current_user.role.capitalize
  end

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
  def new
    @admin = Admin.new
    @admin.build_profile
    @page_title = 'Create My Profile'
    @page_url = '/'
    @profile_url = '/'
  end

  def create
    params[:admin][:user_id] = current_user.id
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to "/admins/#{current_user.id}"
      flash[:success] = "Your profile has been created"
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    # TODO needs to be able to edit group
    @admin = Admin.find_by_user_id(params[:id])
    @home_url = "#{current_user.role}"
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = 'Edit Profile'
  end

  def update
    params[:admin][:user_id] = current_user.id
    @admin = Admin.find_by_user_id(params[:admin][:user_id])

    #paperclip below
    # if params[:mentor][:image].blank?
    #   @mentor.image = nil
    # end

    if @admin.update(admin_params)
      flash[:success] = 'Profile Updated'
      redirect_to "/admins/#{current_user.id}"
    else
      render 'new'
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    admin = Admin.find_by_user_id(params[:id])

    if admin.present?
      admin.destroy
    end
    
    if user.destroy
      flash[:success] = 'Administor Removed'
      redirect_to admins_path
    else
      flash[:error] = 'Administor was NOT Removed'
      redirect_to admins_path
    end
  end

 private

 def admin_params
   params.require(:admin).permit(:first_name, :last_name, :phone_number, :user_id, profile_attributes: [:body])
 end

 # TODO need to un-comment this above at the head this throws an error
 def restrict_access
   if !current_user.admin?
     flash[:success] = "You do not have access to this page"
     redirect_to '/'
   end
 end

end


