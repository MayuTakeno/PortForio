class Employee < ApplicationRecord
  # 社員のモデル

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 複数のblogレコードを持っていて、blogsテーブルの複数のレコードを参照先に指定
  has_many :blogs, dependent: :destroy
  # 複数のchatレコードを持っていて、chatsテーブルの複数のレコードを参照先に指定
  has_many :chats, dependent: :destroy
  # 複数のchat_messageレコードを持っていて、chatsテーブルの複数のレコードを参照先に指定
  has_many :chat_messages, dependent: :destroy
  # 複数のcart_itemレコードを持っていて、cart_itemsテーブルの複数のレコードを参照先に指定
  has_many :cart_items, dependent: :destroy
  # 複数のfavoriteレコードを持っていて、favoritesテーブルの複数のレコードを参照先に指定
  has_many :favorites, dependent: :destroy


# 氏名（姓+名）の定義
  def name
    first_name + last_name
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @employee = Employee.where("name LIKE?", "#{word}")
    elsif search == "forword_match"
      @employee = Employee.where("name LIKE?", "%#{word}")
    elsif search == "backword_match"
      @employee = Employee.where("name LIKE?", "#{word}%")
    elsif search == "partial_match"
      @employee = Employee.where("name LIKE?", "%#{word}%")
    else
      @employee = Employee.includes(:employee)
    end
  end

end
