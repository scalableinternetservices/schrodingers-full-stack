class RsvpsController < ApplicationController
  def new
    @rsvp = Rsvp.new
  end

  def create
    @event= Event.find(params[:event_id])
    @rsvp = @event.rsvps.create(rsvp_params)
    if @rsvp.save
      flash[:success] = "Your RSVP has been saved successfully!"
      redirect_to event_path(@event)
    else
      flash[:error] = "There was a problem saving your RSVP."
      render 'events/show'
    end
  end

  private
    def rsvp_params
      params.require(:rsvp).permit(:user, :response, :status)
    end
end
