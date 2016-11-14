class ResourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resources = Resource.all
    @home_url = authenticated_root_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Home'
  end

  def new
    @resource = Resource.new
  end

  def create
    params[:resource][:user_id] = current_user.id
    document_params = params["resource"].delete("file_array")
    @resource = Resource.new(resource_params)

    binding.pry
    if @resource.save
      binding.pry
      document_params.each do |file|
        @document = Document.new(resource_id: @resource.id, :file_array => file)
        @document.save!
      end

      redirect_to admins_path
      flash[:success] = "A New resource has been added"
    else
      flash[:error] = "Something went wrong"
    end
  end

  def edit
    @resource = Resource.find_by_id(params[:id])
    @home_url = admins_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Edit Resource'
  end

  def update
    resource = Resource.find_by_id(params[:id])

    if resource.update(resource_params)
      flash[:success] = 'Resource Updated'
      redirect_to admins_path
    else
      render 'edit'
    end
  end

  def destroy
    resource = Resource.find_by_id(params[:id])

    if resource.destroy
      flash[:success] = 'Resource Removed'
      redirect_to admins_path
    else
      flash[:error] = 'Resource was NOT Removed'
      redirect_to admins_path
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :link, :description, :user_id)
  end

  def document_params

  end

end
