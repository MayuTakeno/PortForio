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

  def self.guest
    # データの検索と作成を自動的に判断して処理
    find_or_create_by!(first_name: "guest", last_name: "tarou", assigned_to: "営業部", employee_code: "guestshain01", phone_number: "01-2367-2353", email: 'guest@exam.com') do |employee|
      employee.password = SecureRandom.urlsafe_base64
    end
  end

  validates :first_name, presence: { message: "は入力必須です" }
  validates :last_name, presence: { message: "は入力必須です" }
  validates :assigned_to, presence: { message: "は入力必須です"}
  validates :employee_code, presence: { message: "は入力必須です"}
  validates :phone_number, presence: { message: "は入力必須です"}



end
