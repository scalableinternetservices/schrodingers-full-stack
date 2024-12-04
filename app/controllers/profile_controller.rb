class ProfileController < ApplicationController
  def index
    @posts = Post.all
    if !session[:current_user_id] 
      redirect_to '/'
    end
    @user = User.find_by(username: session[:current_user_id])
    @events = @user&.events  # Only the events saved by the current user
  end
end