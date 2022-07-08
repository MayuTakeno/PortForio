class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def index
    @events = Event.includes(:admin)
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(events_params)
      redirect_to admin_event_path(@event)
    else
      :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  private

  def events_params
    params.require(:event).permit(:title, :body, :image, :hold_status, :organizer, :date_and_time, :admin_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
