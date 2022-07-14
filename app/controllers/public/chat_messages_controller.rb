class Public::ChatMessagesController < ApplicationController
  before_action :authenticate_employee!

  def create
    # ChatMessage.create!(chat_message_params)
    # chat_idから一つ取り出す
    chat = Chat.find(params[:chat_id])
    chat_message = ChatMessage.new(chat_message_params)
    chat_message.employee_id = current_employee.id
    chat_message.chat_id = chat.id
    if chat_message.save
      redirect_to public_chat_path(chat)
    else
      render :validater
    end
    # chat_messageの保存ができたら
      # create.jsに送る
      # できなければ
    # else
      # バリデーション表示

    # end
  end

  def destroy
    ChatMessage.find(params[:id]).destroy
    redirect_to public_chat_path(params[:chat_id])
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:message, :employee_id, :chat_id)
  end

end
