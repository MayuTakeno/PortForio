class Admin::ChatsController < ApplicationController
  def index
    @chats = Chat.includes(:employee).page(params[:page]).order(created_at: :desc)
  end

  def show
    @chat = Chat.find(params[:id])
    @chat_messages = @chat.chat_messages.includes(:employee)
  end

  def destroy
    @chat_message = ChatMessage.find(params[:chat_message_id])
    @chat_message.destroy
    redirect_to admin_chat_path(@chat.id)
  end

end
