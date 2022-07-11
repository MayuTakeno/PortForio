class Chat < ApplicationRecord

  #たくさんのチャットを持っている
  #employee_idを主キーとしたテーブルを参照先に指定
  belongs_to :employee
  # たくさんのchat_messageレコードを持っている
  # chat_messagesテーブルの複数のレコードを参照先に指定
  has_many :chat_messages, dependent: :destroy

  # バリデーション
  validates :title, presence: { message: 'は入力必須項目です。' }
  validates :body, presence: { message: 'は入力必須項目です。' }

  # 検索方法（部分検索）
  # def self.looks(search, word)
  #   if search == "partial_match"
  #     @chat = Chat.where("title LIKE?", "%#{word}%")
  #   end
  # end

end
