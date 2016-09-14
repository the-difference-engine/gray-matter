class ResourcesController < ApplicationController
  def new
    # @resource = Resource.new
  end

  def create
    params[:resource][:user_id] = current_user.id
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to admins_path
      flash[:success] = "A New resource has been added"
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

  def resource_params
    params.require(:resource).permit(:title, :link, :description, :user_id)
  end

end
