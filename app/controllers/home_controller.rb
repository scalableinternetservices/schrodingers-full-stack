class HomeController < ApplicationController

  def index
    @posts = Post.includes(:comments).all.order(created_at: :desc)
    @events = Event.left_joins(:rsvps)
      .select("events.*, 
        COUNT(CASE WHEN rsvps.status = 'yes' THEN 1 END) AS yes_count, 
        COUNT(CASE WHEN rsvps.status = 'no' THEN 1 END) AS no_count")
      .group('events.id')
    @messages = Message.all
  end
end