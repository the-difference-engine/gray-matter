class UsersController < ApplicationController

  def index
    # TODO this is a total hack fix this
    # redirect_to "/#{current_user.role}"
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = current_user.role.capitalize
  end

end
