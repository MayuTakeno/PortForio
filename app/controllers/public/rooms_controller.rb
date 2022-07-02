class Public::RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @qa_chats = QaChat.all
  end

  def show
  end

end
