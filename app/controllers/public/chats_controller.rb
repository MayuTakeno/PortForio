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
      redirect_to public_chats_path
    else render :index
    end
  end

  def show
  end

  def destroy
    @chat.destroy
    redirect_to public_chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:title, :body)
  end

end
