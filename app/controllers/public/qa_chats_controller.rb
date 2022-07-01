class Public::QaChatsController < ApplicationController
  before_action :authenticate_employee!

  def index
  end

  def show
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
    # @room内のchatsを取得
    @qa_chats = @room.qa_chats
    # room_idにchatを新規作成
    @qa_chat = QaChat.new(room_id: @room.id)
  end

  def create
    # 現在ログインしている社員のチャットを新規作成する
    @qa_chat = current_employee.qa_chats.new(qa_chat_params)
    # validatesにかからなければ保存する
    render :validater unless @qa_chat.save
  end

  def destroy
    @qa_chat = QaChat.find(params[:id])
    @qa_chat.destroy
    redirect_to public_qa_chat_path(current_employee)
  end

  private

  def qa_chat_params
    params.require(:qa_chat).permit(:title, :message, :room_id)
  end

end
