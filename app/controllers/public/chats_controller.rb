class Public::ChatsController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_chat, except: [:new, :index, :create, :show]

  def index
    @chat = Chat.new
    @chats = Chat.includes(:employee).page(params[:page]).order(created_at: :desc)
    if params[:word].present?
      @chats = Chat.where("title LIKE?", "%#{params[:word]}%").page(params[:page]).order(created_at: :desc)
    end
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
    @chat_messages = @chat.chat_messages.includes(:employee)
    # chat_messageにmessageを新規作成するためのインスタンス作成
    @chat_message = @chat.chat_messages.build(employee_id: current_employee.id) if current_employee
  end

  def destroy
    @chats = Chat.includes(:employee).order(created_at: :desc)
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
