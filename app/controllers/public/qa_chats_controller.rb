class Public::QaChatsController < ApplicationController
  # 閲覧権限
  before_action :authenticate_employee!
  # privateのset_chatにリファクタリング
  before_action :set_chat, only: [:show, :create]

  # def index
  #   # roomごとに検索かけて、一つだけ取り出す
  #   @rooms = Room.all
  #   # 空の配列を用意する
  #   @qa_chats = []
  #   # 一つずつ取り出して検索をかける
  #   @rooms.each do |room|
  #     # room_idの中の最初の投稿だけを取り出す
  #     room_search = QaChat.where(room_id: room.id).first
  #     # room_searchがnilでなければ
  #     if room_search
  #       # room_searchで取り出した内容を空の配列に入れる
  #       @qa_chats.push(room_search)
  #     end
  #   end
  #   # 重複idを削除
  #   # @qa_chats = QaChat.all
  #   # debugger
  # end

  def show
    # room_idにchatを新規作成
    @qa_chat = QaChat.new(room_id: @room.id)
    # @room内のchatsを取得
    @qa_chats = @room.qa_chats
  end

  def create
    # 現在ログインしている社員のチャットを新規作成する
    @qa_chat = current_employee.qa_chats.new(qa_chat_params)
    # room内のchatsを取得
    @qa_chats = @room.qa_chats
    # validatesにかからなければ保存する
    render :validater unless @qa_chat.save
  end

  def destroy
    # qa_chatを一つ取得
    @qa_chat = QaChat.find(params[:id])
    # 取得したqa_chatを削除
    @qa_chat.destroy
    redirect_to public_qa_chat_path(current_employee)
  end

  private

  def qa_chat_params
    params.require(:qa_chat).permit(:title, :message, :room_id)
  end

  def set_chat
    # 社員の情報を一つ取り出す
    @employee = Employee.find(params[:id])
    # 現在ログインしている社員のemployee_roomsにあるroom_idを配列で取得
    rooms = current_employee.employee_rooms.pluck(:room_id)
    # employeeIDがチャット相手の社員のIDと一致する # room_idが、上記のroomsのどれか一つに一致するレコード
    employee_rooms = EmployeeRoom.find_by(employee_id: @employee.id, room_id: rooms)
    # employee_roomが空でなかった場合
    unless employee_rooms.nil?
      # employee_roomのroomを続行
      @room = employee_rooms.room
    # employee_roomsが空だった場合
    else
      # 新しく部屋を作る
      @room = Room.new
      # 新しく作った部屋をDBに保存
      @room.save
      # 現在ログインしている社員と相手の社員分のemployee_roomを作成
      EmployeeRoom.create(employee_id: current_employee.id, room_id: @room.id)
      EmployeeRoom.create(employee_id: @employee.id, room_id: @room.id)
    end
  end

end
