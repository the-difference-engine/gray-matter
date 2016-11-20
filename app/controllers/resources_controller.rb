class ResourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resources = Resource.all.order('created_at DESC')
    @home_url = authenticated_root_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Home'
  end

  def new
    @resource = Resource.new
  end

  def create
    params[:resource][:user_id] = current_user.id
    params[:resource][:links] = params[:links]
    document_params = params["resource"].delete("file_array")
    @resource = Resource.new(resource_params)
    if @resource.save
      if document_params.present?
        document_params.each do |file|
          @document = Document.new(resource_id: @resource.id, :file_array => file)
          @document.save!
        end
      end
      redirect_to admins_path
      flash[:success] = "A New resource has been added"
    else
      flash[:error] = "Something went wrong"
    end
  end

  def edit
    @resource = Resource.find_by_id(params[:id])
    @links = @resource.links
    @documents = @resource.documents
    @home_url = admins_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Edit Resource'
  end

  def update
    resource = Resource.find_by_id(params[:id])
    resource.links = params[:links]
    document_params = params["resource"].delete("file_array")
      if document_params.present?
        document_params.each do |file|
          @document = Document.new(resource_id: resource.id, :file_array => file)
          @document.save!
        end
      end

    if resource.update(resource_params)
      flash[:success] = 'Resource Updated'
      redirect_to admins_path(tab: :resources)
    else
      render 'edit'
    end
  end

  def destroy
    resource = Resource.find_by_id(params[:id])

    if resource.destroy
      flash[:success] = 'Resource Removed'
      redirect_to admins_path(tab: :resources)
    else
      flash[:error] = 'Resource was NOT Removed'
      render 'edit'
    end
  end

  # TODO this should go into the doc controller or at least the model?
  def delete_document
    document = Document.find_by_id(params[:document_id])
    if document.destroy
      flash[:success] = 'Document Removed'
      redirect_to admins_path(tab: :resources)
    else
      flash[:error] = 'Document was NOT Removed'
      render 'edit'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :link, :description, :user_id, links: [])
  end

  def document_params

  end

end
