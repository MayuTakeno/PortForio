class Employee < ApplicationRecord
  # 社員のモデル

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #複数のblogレコードを持っていて、blogsテーブルを参照先に指定
  has_many :blogs, dependent: :destroy
  # 複数のqa_chatレコードを持っていて、qa_chatsテーブルを参照先に指定
  has_many :qa_chats, dependent: :destroy
  has_many :employee_rooms, dependent: :destroy

# 氏名（姓+名）の定義
 def name
   first_name + last_name
 end

end
