class Public::ChatMessagesController < ApplicationController

  def create
    # chat_idから一つ取り出す
    chat = Chat.find(params[:chat_id])
    message = current_employee.chat_messages.new(chat_message_params)
    message.chat_id = chat.id
    message.save
    redirect_to public_chat_path(chat)
  end

  def destroy
  end

  private

  def chat_message_params
    params.require(:chat_params).permit(:message)
  end

end
