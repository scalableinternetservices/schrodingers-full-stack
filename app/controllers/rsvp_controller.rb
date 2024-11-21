class RsvpController < ApplicationController
  def new
    @rsvp = Rsvp.new
  end

  private
    def rsvp_params
      params.require(:rsvp).permit(:host, :user, :response)
    end
end
