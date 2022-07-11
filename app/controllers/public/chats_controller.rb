class Public::ChatsController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_chat, except: [:new, :index, :create, :show]

  def index
    @chat = Chat.new
    @chats = Chat.includes(:employee).order(created_at: :desc)
  end

  def create
    @chat = Chat.new(chat_params)
    # 投稿した社員を識別するIDを、現在ログインしている社員のIDに指定
    @chat.employee_id = current_employee.id
    if @chat.save
      @chats = Chat.includes(:employee).order(created_at: :desc)
    else
      render :validater
    end
  end

  def show
    @chat = Chat.includes(:employee).find(params[:id])
    # chat_messagesにchatに関連したコメントを格納
    @chat_messages = @chat.chat_messages.includes(:employee).all
    # chat_messageにmessageを新規作成するためのインスタンス作成
    @chat_message = @chat.chat_messages.build(employee_id: current_employee.id) if current_employee
  end

  def destroy
    @chats = Chat.all
    @chat.destroy
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:title, :body)
  end

end
