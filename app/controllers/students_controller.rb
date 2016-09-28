class StudentsController < ApplicationController
  before_filter :authenticate_user!
  # before_action :restrict_access

  def index
    @groups = Group.all
    @students = Student.all
    @profiles = Profile.all
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @group_url = "/groups/#{@groups.name}"
    @page_title = current_user.role.capitalize
 end

 def show
   @student = Student.find_by_user_id(params[:id])
   # @groups = [current_user.group]
   if @student.nil?
     redirect_to new_student_path
   else
     @profile_url = "#{current_user.id}"
   end
   @home_url = authenticated_root_path
   @page_url = student_path
   @page_title = current_user.role.capitalize
 end

 def new
   @student = Student.new
   @student.build_profile
   @page_title = 'Create My Profile'
   @home_url = authenticated_root_path
   @profile_url = "#{current_user.id}"
 end

 def create
   params[:student][:user_id] = current_user.id
   params[:student][:contact_email] = current_user.email
   @student = Student.new(student_params)
   if @student.save
     redirect_to "/students/#{current_user.id}"
     flash[:success] = "Your profile has been created"
   else
     flash[:error] = "Something went wrong"
     render 'new'
   end
 end

 def edit
   # TODO needs to be able to edit group
   @student = Student.find_by_user_id(params[:id])
   @home_url = "#{current_user.role}"
   @profile_url = "#{current_user.role}/#{current_user.id}" 
   @page_title = 'Edit Profile'
 end

 def update
   params[:student][:user_id] = current_user.id
   @student = Student.find_by_user_id(params[:student][:user_id])

   #paperclip below
   # if params[:mentor][:image].blank?
   #   @mentor.image = nil
   # end

   if @student.update(student_params)
     flash[:success] = 'Profile Updated'
     redirect_to "/students/#{current_user.id}"
   else
     render 'new'
   end
 end

 def destroy
   user = User.find_by_id(params[:id])
   student = Student.find_by_user_id(params[:id])

   if student.present?
     student.destroy
   end
   
   if user.destroy
     flash[:success] = 'Student Removed'
     redirect_to admins_path
   else
     flash[:error] = 'Student was NOT Removed'
     redirect_to admins_path
   end
 end
 
 private

 def student_params
   params.require(:student).permit(:gender, :school, :grade, :first_name, :last_name, :phone_number, :contact_email, :user_id, profile_attributes: [:body])
 end
 # Everyone can have access to student
 # def restrict_access
 #   if !current_user.student? && !current_user.admin?
 #     flash[:success] = "You do not have access to this page"
 #     redirect_to "/#{current_user.role}"
 #   end
 # end
end
