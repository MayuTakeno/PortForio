class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    @event.admin_id = current_admin.id
    tag_list = params[:event][:tag_name].split(',')
    if @event.save
      @event.save_tag(tag_list)
      # 保存できたらイベント一覧に遷移
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def index
    @events = params[:tag_id].present? ? Tag.find(params[:tag_id]).events : Event.includes(:admin).order(created_at: :desc)
    if params[:word].present?
      @events = Event.where("title LIKE?", "%#{params[:word]}%").order(created_at: :desc)
    end
    @tag_list = Tag.all
  end

  def show
    @event_tags = @event.tags
  end

  def edit
  end

  def update
    tag_list = params[:event][:tag_name].split(',')
    if @event.update(events_params)
      @event.save_tag(tag_list)
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
    params.require(:event).permit(:title, :body, :image, :hold_status, :organizer, :date_and_time, :name_tag)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
