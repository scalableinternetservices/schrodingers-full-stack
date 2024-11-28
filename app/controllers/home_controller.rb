class HomeController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @events = Event.all
    @messages = Message.all
  end
end