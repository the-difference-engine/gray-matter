class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :get_events, only: [:index]

  # GET /events
  # GET /events.json
  def index
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = current_user.role.capitalize
    @the_date = params["the_date"].to_date
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = current_user.role.capitalize
  end

  # POST /events
  # POST /events.json
  def create
    # date = Date.new event["the_date(1i)"].to_i, event["the_date(2i)"].to_i, event["the_date(3i)"].to_i
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to admins_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admins_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def get_events
      ids = params["events"].map { |string_id| string_id.to_i }
      @events = Event.where(id: ids)
    end

    def set_params(params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:document, :title, :description, :start_time, :end_time, :the_date, :all_day, :event_date)
    end
end
