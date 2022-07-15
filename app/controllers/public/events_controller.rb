class Public::EventsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @events = params[:tag_id].present? ? Tag.find(params[:tag_id]).events : Event.includes(:admin).order(created_at: :desc)
    if params[:word].present?
      @events = Event.where("title LIKE?", "%#{params[:word]}%").order(created_at: :desc)
    end
    if params[:date].present?
      @events = Event.where("start_time => ?")
    end
    @tag_list = Tag.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
