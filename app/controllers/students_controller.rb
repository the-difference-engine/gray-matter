class StudentsController < ApplicationController
  before_action :restrict_access

  def index
    @page_title = 'Students'
    @page_url = '/students'
    @students = Student.all
    render "index.html.erb"
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

 def restrict_access
   if current_user.role != 'student'
     flash[:success] = "You do not have access to this page"
     redirect_to '/'
   end
 end
end
