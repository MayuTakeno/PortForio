class Public::ChatsController < ApplicationController
  before_action :set_chat, except: [:new, :index, :create]

  def index
    @chat = Chat.new
    @chats = Chat.all
  end

  def create
    @chat = Chat.new(chat_params)
    # 投稿した社員を識別するIDを、現在ログインしている社員のIDに指定
    @chat.employee_id = current_employee.id
    if @chat.save
      @chats = Chat.all
    else
      render :validater
    end
  end

  def show
    @chat_new = Chat.new
    @chat_new.save
  end

  def destroy
    @chats = Chat.all
    @chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:title, :body)
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

end
