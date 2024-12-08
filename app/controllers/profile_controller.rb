class ProfileController < ApplicationController
  ITEMS_PER_PAGE = 5

  def index
    if !session[:current_user_id]
      redirect_to '/'
    else
      @events = @user&.events  # Only the events saved by the current user
      @eventsLength = @events.count # Total number of posts
      @eventPage = params.fetch(:eventPage, 0).to_i
      @eventPage = 0 if @eventPage < 0
      @eventPage = [ @eventPage, (@eventsLength / ITEMS_PER_PAGE).floor ].min
      @events = @events.order(created_at: :desc)
                   .offset(@eventPage * ITEMS_PER_PAGE)
                   .limit(ITEMS_PER_PAGE)

      @postsLength = Post.where(username: session[:current_user_id]).count # Total number of posts
      @postPage = params.fetch(:postPage, 0).to_i
      @postPage = 0 if @postPage < 0
      @postPage = [ @postPage, (@postsLength / ITEMS_PER_PAGE).floor ].min
      @posts = Post.where(username: session[:current_user_id])
                   .order(created_at: :desc)
                   .offset(@postPage * ITEMS_PER_PAGE)
                   .limit(ITEMS_PER_PAGE)

      @postedEventsLength = Event.where(username: session[:current_user_id]).count # Total number of posts
      @postedEventPage = params.fetch(:postedEventPage, 0).to_i
      @postedEventPage = 0 if @postedEventPage < 0
      @postedEventPage = [ @postedEventPage, (@postedEventsLength / ITEMS_PER_PAGE).floor ].min
      @postedEvents = Event.where(username: session[:current_user_id])
                   .order(created_at: :desc)
                   .offset(@postedEventPage * ITEMS_PER_PAGE)
                   .limit(ITEMS_PER_PAGE)
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