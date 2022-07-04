class Public::ChatMessagesController < ApplicationController

  def create
    # chat_idから一つ取り出す
    chat = Chat.find(params[:chat_id])
    message = ChatMessage.new(chat_message_params)
    message.employee_id = current_employee.id
    message.save
    redirect_to public_chat_path(chat)
  end

  def destroy
    ChatMessage.find(params[:id]).destroy
    redirect_to public_chat_path(params[:chat_id])
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:message)
  end

end
