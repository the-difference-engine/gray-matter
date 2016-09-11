class ProfilesController < ApplicationController
  def show
    @page_title = current_user.page_title
    @home_url = authenticated_root_path
  end
end
