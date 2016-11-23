class EventsController < ApplicationController
  before_action :get_events, only: [:index]
  include DocumentHelper

  # GET /events
  # GET /events.json
  def index
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = "Home"
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
    @event = Event.find_by_id(params[:id])
    @documents = @event.documents
    @links = @event.links
    @home_url = authenticated_root_path
    @profile_url = "#{current_user.role}/#{current_user.id}" 
    @page_title = "Home"
  end

  # POST /events
  # POST /events.json
  def create
    params[:event][:links] = params[:links]
    document_params = params["event"].delete("file_array")

    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        if document_params.present?
          document_params.each do |file|
            @document = Document.new(event_id: @event.id, :file_array => file)
            @document.save!
          end
        end
        format.html { redirect_to admins_path(tab: :events), notice: "A New event has been added" }
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
    @event.links = params[:links]
    document_params = params["event"].delete("file_array")
    if document_params.present?
      document_params.each do |file|
        @document = Document.new(event_id: @event.id, :file_array => file)
        @document.save!
      end
    end

    respond_to do |format|
      if @event.update(event_params)
        flash[:success] = 'Event was successfully updated.'
        format.html { redirect_to admins_path(tab: :events) }
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
      format.html { redirect_to admins_path(tab: :events), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_events
      ids = params["events"].map { |string_id| string_id.to_i }
      @events = Event.where(id: ids)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:document, :title, :description, :start_time, :end_time, :the_date, :all_day, :event_date, links: [])
    end
end
