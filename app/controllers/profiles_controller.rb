class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @page_title = current_user.page_title
    @home_url = authenticated_root_path
  end
end
