class ProfileController < ApplicationController
  def index
    if !session[:current_user_id]
      redirect_to '/'
    else
      @user = User.find_by(username: session[:current_user_id])
      @posts = Post.where(username: session[:current_user_id])  # Display posts created by the current user
      @events = @user&.events  # Only the events saved by the current user
    end
  end

  def update
    @user = User.find_by(username: session[:current_user_id])
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile picture updated!"
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_picture)  # Permit the profile picture attribute
  end
end