class ResourcesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :set_links_documents, only: [:index, :edit]
  include DocumentHelper

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
      redirect_to admins_path(tab: :resources)
      flash[:success] = "A New resource has been added"
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
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

  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def set_links_documents
    if @resource.links.present?
      return @links = @resource.links
    else
      return @links = []
    end
  end

  def resource_params
    params.require(:resource).permit(:title, :link, :description, :user_id, links: [])
  end

end
