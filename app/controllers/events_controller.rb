class EventsController < ApplicationController
  ITEMS_PER_PAGE = 5
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    if session[:current_user_id] != @event.username
      @show = false
    else
      @show = true
    end
    @commentsLength = @event.comments.count # Total number of posts
    @commentPage = params.fetch(:commentPage, 0).to_i
    @commentPage = 0 if @commentPage < 0
    @commentPage = [ @commentPage, (@commentsLength / ITEMS_PER_PAGE).floor ].min
    @comments = @event.comments
                 .order(created_at: :desc)
                 .offset(@commentPage * ITEMS_PER_PAGE)
                 .limit(ITEMS_PER_PAGE)
    @rsvpsLength = @event.rsvps.count # Total number of posts
    @rsvpsPage = params.fetch(:rsvpsPage, 0).to_i
    @rsvpsPage = 0 if @rsvpsPage < 0
    @rsvpsPage = [ @rsvpsPage, (@rsvpsLength / ITEMS_PER_PAGE).floor ].min
    @rsvps = @event.rsvps
                .order(created_at: :desc)
                .offset(@rsvpsPage * ITEMS_PER_PAGE)
                .limit(ITEMS_PER_PAGE)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
    puts session[:current_user_id]
    if session[:current_user_id] != @event.username
      @show = false
    else
      @show = true
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if session[:current_user_id] == @event.username
      @event.destroy
      redirect_to root_path, status: :see_other
    end
  end
  private
  def event_params
    params.expect(event: [ :time, :location, :title, :description, :username ])
  end
end
