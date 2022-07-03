class Room < ApplicationRecord
  # 社員同士の会話部屋

  # 複数のemployee_roomレコードを持っていて、employee_roomsテーブルを参照先に指定
  has_many :employee_rooms, dependent: :destroy
  has_many :employees, through: :employee_rooms
  # 複数のqa_chatレコードを持っていて、qa_chatsテーブルを参照先に指定
  has_many :qa_chats, dependent: :destroy
  has_many :employees, through: :qa_chats

end
