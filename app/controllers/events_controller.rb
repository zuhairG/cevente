class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :rsvp, :invite]


load_and_authorize_resource
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
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
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.event_members.build({invitable: current_user, rsvp_status: :attending})

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
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
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rsvp
     # find current_user member
     if params[:invitation_token]
      # find member by invitation_token
      event_member = @event.accept_invitation(params[:invitation_token], current_user)
      if (!event_member)
        # invalid token
      end
    else
     event_member = @event.event_members.where(["invitable_id = ?", current_user.id])[0]
    end
     if event_member
       event_member.rsvp_status = params[:rsvp_status]
     else
       # no member, so create one
       event_member = @event.event_members.build({invitable: current_user, rsvp_status: :attending})
     end
     if event_member.save
       redirect_to @event, notice: 'Status was successfully updated.'
     else
       redirect_to @event, notice: 'Status could not be saved.'
     end
   end

   def invite
  params[:invitations][:emails].split(",").each do |email|
    # find user-member by email or use email as invitation_key
    if member = @event.invite(User.find_by_email(email) || email)
      # send invitation email
      EventMailer.invitation(email, @event, member, current_user).deliver
  else
    #if user does not exist create an event member instance for that email
    member = @event.event_members.build({invitation_token: email, rsvp_status: :pending})
    EventMailer.invitation(email, @event, member, current_user).deliver

  end
  end
  respond_to do |format|
    format.html { redirect_to @event, notice: 'Invitations have been successfully sent.' }
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      @location = Location.find(@event.location_id)
      @location_for_map = @location.address1 + ',' + @location.address2 + ',' + @location.city + ',' + @location.country
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location_id, :desc, :start_date, :end_date, :free_food, :status, :event_type_id, :num_views, :rsvp_max, :image)
    end
end
