class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :first_logged_in?

  def index
    @header_styles = ["heading-color-one",
                     "heading-color-two",
                     "heading-color-three",
                     "heading-color-four",
                     "heading-color-five"]
    @event_date = []
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = "Home"
    @announcements = Announcement.all.order('created_at DESC')
    @resources = Resource.all
    events = Event.all
    @events_by_date = events.group_by(&:the_date)
  end

end
