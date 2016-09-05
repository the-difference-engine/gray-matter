class ProfilesController < ApplicationController

  def show
    # TODO this is where the serailizer will come in bc I need current_user profile and mentor well not here maybe in mentor or user.. not sure
   
    # Vmaybe the profile needs to be created before I can add shit to it
    # @mentor_profile = current_user.profile
    @create_profile = true
    # move all this to the profile controller
    # if @mentor_profile.nil?
    #   @mentor_profile = Profile.new
    #   @mentor_profile.save
    #   @create_profile = true
      @button_title = "Create My Profile"
    # end
    @page_title = current_user.page_title
    @home_url = "/#{ current_user.role }"
  end
end
