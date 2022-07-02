class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
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
  end

  def show
  end

  def edit
  end

  private

  def events_params
    params.require(:event).permit(:title, :body, :image, :hold_status)
  end

end
