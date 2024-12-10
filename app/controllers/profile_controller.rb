class ProfileController < ApplicationController
  def index
    @posts = Post.includes(:comments).all
    if !session[:current_user_id]
      redirect_to "/"
    end
    @user = User.find_by(username: session[:current_user_id])
    @events = @user&.events  # Only the events saved by the current user
    @postedEvents = Event.left_joins(:rsvps)
    .select("events.*, 
      COUNT(CASE WHEN rsvps.status = 'yes' THEN 1 END) AS yes_count, 
      COUNT(CASE WHEN rsvps.status = 'no' THEN 1 END) AS no_count")
    .group('events.id')
  end
end
