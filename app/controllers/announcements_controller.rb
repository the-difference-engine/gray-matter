class AnnouncementsController < ApplicationController
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
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :body, :user_id)
  end

end
