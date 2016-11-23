class AnnouncementsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :set_links_documents, only: [:index, :edit]
  include DocumentHelper

  def new
    @announcement = Announcement.new
  end

  def create
    params[:announcement][:user_id] = current_user.id
    params[:announcement][:links] = params[:links]
    document_params = params["announcement"].delete("file_array")
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      if document_params.present?
        document_params.each do |file|
          @document = Document.new(announcement_id: @announcement.id, :file_array => file)
          @document.save!
        end
      end
      redirect_to admins_path(tab: :announcements)
      flash[:success] = "A New announcement has been added"
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @links = @announcement.links
    @documents = @announcement.documents
    @home_url = admins_path
    @profile_url = "/#{current_user.role}/#{current_user.id}" 
    @page_title = 'Edit Announcement'
  end

  def update
    announcement = Announcement.find_by_id(params[:id])
    announcement.links = params[:links]

    document_params = params["announcement"].delete("file_array")
    if document_params.present?
      document_params.each do |file|
        @document = Document.new(announcement_id: announcement.id, :file_array => file)
        @document.save!
      end
    end

    if announcement.update(announcement_params)
      flash[:success] = 'Announcement Updated'
      redirect_to admins_path(tab: :announcements)
    else
      render 'edit'
    end
  end

  def destroy
    announcement = Announcement.find_by_id(params[:id])

    if announcement.destroy
      flash[:success] = 'Announcement Removed'
      redirect_to admins_path(tab: :announcements)
    else
      flash[:error] = 'Announcement was NOT Removed'
      redirect_to admins_path(tab: :announcements)
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find_by_id(params[:id])
  end

  def set_links_documents
    if @announcement.links.present?
      return @links = @announcement.links
    else
      return @links = []
    end
  end

  def announcement_params
    params.require(:announcement).permit(:title, :body, :user_id, links: [])
  end

end
