class StudentsController < ApplicationController
  # before_action :restrict_access

  def index
    @page_title = current_user.page_title
    @home_url = "/#{current_user.role}"
    @profile_url = "/profiles/#{current_user.id}"
    @students = Student.all
    @groups = Group.all
 end

 def show
   @student = Student.find_by(id: params[:id])
   render "show.html.erb"
 end

 def create
   @student = Student.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      contact_email: params[:contact_email],
      phone_number: params[:phone_number])
   redirect_to "index.html.erb"
 end

 def destroy
   @student = Student.find_by(id: params[:id])
   @admin.destroy
   redirect_to "/students"
 end
 
 private

 # Everyone can have access to student
 # def restrict_access
 #   if !current_user.student? && !current_user.admin?
 #     flash[:success] = "You do not have access to this page"
 #     redirect_to "/#{current_user.role}"
 #   end
 # end
end
