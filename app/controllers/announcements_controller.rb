class AnnouncementsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @announcement = Announcement.new
  end

  def create
    params[:announcement][:user_id] = current_user.id
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      redirect_to admins_path
      flash[:success] = "A New announcement has been added"
    else
      flash[:error] = "Something went wrong"
    end
  end

  def edit
    @announcement = Announcement.find_by_id(params[:id])
    @home_url = admins_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Edit Announcement'
  end

  def update
    announcement = Announcement.find_by_id(params[:id])

    if announcement.update(announcement_params)
      flash[:success] = 'Announcement Updated'
      redirect_to admins_path
    else
      render 'edit'
    end
  end

  def destroy
    announcement = Announcement.find_by_id(params[:id])

    if announcement.destroy
      flash[:success] = 'Announcement Removed'
      redirect_to admins_path
    else
      flash[:error] = 'Announcement was NOT Removed'
      redirect_to admins_path
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :body, :user_id)
  end

end
