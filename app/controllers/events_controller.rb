class EventsController < ApplicationController
  
  def index
    @events = Event.includes(:rsvps).includes(:comments).includes(:invites).all
  end

  def show
    @event = Event.find(params[:id])
    if session[:current_user_id] != @event.username
      @show = false
    else
      @show = true
    end
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
    params.expect(event: [:time, :location, :title, :description, :username])
  end
end
