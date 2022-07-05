class Public::ChatMessagesController < ApplicationController

  def create
    # chat_idから一つ取り出す
    @chat = Chat.find(params[:chat_id])
    @message = current_employee.chat_messages.new(chat_message_params)
    @message.employee_id = current_employee.id
    @message.chat_id = @chat.id
    # chat_messageの保存ができたら
    if @message.save
      # 元の画面を遷移先に指定
      redirect_to public_chat_path(@chat)
      # できなければ
    else
      render :validater
    end
  end

  def destroy
    ChatMessage.find(params[:id]).destroy
    redirect_to public_chat_path(params[:chat_id])
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:message).merge(chat_id: params[:chat_id])
  end

end
