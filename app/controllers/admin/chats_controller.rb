class Admin::ChatsController < ApplicationController
  def index
    @chats = Chat.includes(:employee).page(params[:page]).order(created_at: :desc)
  end

  def show
    @chat = Chat.find(params[:id])
    @chat_messages = @chat.chat_messages.includes(:employee)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to admin_chats_path
  end

end
