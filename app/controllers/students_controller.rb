class StudentsController < ApplicationController
  def index
   @students = Student.all
    render "index.html.erb"
 end

 def show
   @student = Student.find_by(id: params[:id])
   render "show.html.erb"
 end

 def create
  
  # @student = Student.create(student_params)
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
 
  def avatar_form
    render 'avatar_form.html.erb'
  end 
 
  def student_avatar
    @student.update(avatar: params)
    redirect_to 'index.html.erb'
  end 

 def student_params 
   params.require(:student).permit(:first_name, :last_name, :contact_email, :phone_number, :avatar)
 end 

end
