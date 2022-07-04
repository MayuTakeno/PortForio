class ChatMessage < ApplicationRecord
  
  # employee_idを主キーにもつモデルに対応したテーブルを参照先に指定
  belongs_to :employee
  # chat_idを主キーにもつモデルに対応したテーブルを参照先に指定
  belongs_to :chat
  
end
