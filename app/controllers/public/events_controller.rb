class Public::EventsController < ApplicationController
  def index
    @events = params[:tag_id].present? ? Tag.find(params[:tag_id]).events : Event.includes(:admin).order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
