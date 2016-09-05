class UsersController < ApplicationController

  def index
# TODO this is a total hack fix this
    redirect_to "/#{current_user.role}"
  end

end
