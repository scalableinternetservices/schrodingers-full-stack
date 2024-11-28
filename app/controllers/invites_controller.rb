class InvitesController < ApplicationController

  def new 
    @invite = Invite.new
  end

  def create
    @event = Event.find(params[:event_id])
    @invite = @event.invites.create(invite_params)
    @invite.save
    redirect_to event_path(@event)
  end

  private
  def invite_params
    params.require(:invite).permit(:event_id, :guest, :note)
  end


end
