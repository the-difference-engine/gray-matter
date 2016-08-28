class GroupsController < ApplicationController
  def show
    @page_title = current_user.page_title
    @home_url = "/#{current_user.role}"
    @profile_url = "/mentors/#{current_user.id}" #this needs to change, see admin current_user.role
    @groups = Group.where(name: params[:name])
  end
end
