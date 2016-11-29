class StoriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_controller

  def index
    @stories = Story.all.order('created_at DESC')
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    params[:story][:user_id] = current_user.id
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
      flash[:success] = "A New post has been added"
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def set_controller
    @home_url = authenticated_root_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Home'
  end

  def story_params
    params.require(:story).permit(:title, :body, :user_id)
  end
end
