class Chat < ApplicationRecord

  # employeeはたくさんのチャットを持っている
  # employee_idを主キーとしたテーブルを参照先に指定
  belongs_to :employee

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
end
