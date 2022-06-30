class Blog < ApplicationRecord

  has_one_attached :image
  
  # employeeを主キーにもつテーブルを参照先に指定
  belongs_to :employee

  # バリデーション
  validates :title, presence: { message: 'は入力必須です。' }
  validates :body, presence: { message: 'は入力必須です。' }
end
