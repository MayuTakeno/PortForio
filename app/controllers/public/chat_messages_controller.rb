class Public::ChatMessagesController < ApplicationController

  def create
    # chat_idから一つ取り出す
    @chat = Chat.find(params[:chat_id])
    @chat_message = @chat.chat_messages.new(chat_message_params)
    @chat_message.employee_id = current_employee.id
    if @chat_message.save
      redirect_to request.referer
    else
      @chat_new = Chat.new
      @chat_messages = @chat.chat_messages
      redirect_to new_public_chat_path
    end

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
