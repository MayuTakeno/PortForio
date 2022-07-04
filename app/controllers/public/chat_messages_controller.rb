class Public::ChatMessagesController < ApplicationController

  def create
    # chat_idから一つ取り出す
    @chat = Chat.find(params[:chat_id])
    # chat_messageをchat_message_paramsに新規作成
    @chat_message = @chat.chat_messages.new(chat_message_params)
    # 現在ログインしているユーザをchat_messageのemployee_idに指定
    @chat_message.employee_id = current_employee.id
    # chat_messageの保存ができたら
    if @chat_message.save
      @chat_messages = @chat.chat_messages
      redirect_to request.referer
      # できなければ
    else
      # 空のカラムを用意
      render :validater
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
