class Public::EventsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @events = params[:tag_id].present? ? Tag.find(params[:tag_id]).events : Event.includes(:admin).order(created_at: :desc)
    # キーワード検索分岐
    if params[:word].present?
      @events = Event.where("title LIKE?", "%#{params[:word]}%").order(created_at: :desc)
    end
    # 日付検索分岐
    if params[:date_and_time].present?
      date = params[:date_and_time]
      @events = Event.where(["date_and_time LIKE?", "#{date}%"]).order(created_at: :desc)
    end
    @tag_list = Tag.all
  end

  # def search
  #   @events = @admin.events
  #   @@event = Event.new
  #   if params[:date_and_time] == nil?
  #     @search_event = "日付を選択してください"
  #   else
  #     date = params[:date_and_time]
  #     @search_book =@events.where(["date_and_time LIKE?", "#{date}%"])
  #   end
  # end

  def show
    @event = Event.find(params[:id])
  end
end
