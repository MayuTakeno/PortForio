class QaChat < ApplicationRecord
  # 社員が発言した内容を保存する部屋

  # employee_idを主キーとしたテーブルを参照先に指定
  belongs_to :employee
  # room_idを主キーとしたテーブルを参照先に指定
  belongs_to :room
end
