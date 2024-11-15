class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @messages = Message.all
  end
end
