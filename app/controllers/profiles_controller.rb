class ProfilesController < ApplicationController
  def show
    @page_title = current_user.page_title
    @home_url = "/#{ current_user.role }"
  end
end
