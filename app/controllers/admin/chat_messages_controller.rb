class Admin::ChatMessagesController < ApplicationController

  def destroy
    @chat_message = ChatMessage.find(params[:id]).destroy
    redirect_to admin_chat_path(params[:chat_id])
  end
end
