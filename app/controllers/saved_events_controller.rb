class SavedEventsController < ApplicationController
    def create
        if !session[:current_user_id] 
            redirect_to '/'
        end
        @user = User.find_by(username: session[:current_user_id])
        @event = Event.find(params[:event_id])
        @user.events << @event  # Add event to current user's saved events
        redirect_to profile_path
    end

    def destroy
        if !session[:current_user_id] 
            redirect_to '/'
        end
      
        @user = User.find_by(username: session[:current_user_id])
        @event = Event.find(params[:event_id])
        @user.events.delete(@event)  # Remove event from current user's saved events
        redirect_to profile_path
    end
end
