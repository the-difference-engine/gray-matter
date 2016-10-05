class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :first_logged_in?

  def index
    @header_styles = ["heading-color-one",
                     "heading-color-two",
                     "heading-color-three",
                     "heading-color-four",
                     "heading-color-five"]
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = current_user.role.capitalize
    @announcements = Announcement.all.order('created_at DESC')
    @resources = Resource.all
     
  end

end
