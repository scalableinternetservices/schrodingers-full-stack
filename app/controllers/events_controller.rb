class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: "...", description: "...")

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end
end
