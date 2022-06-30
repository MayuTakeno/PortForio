class Blog < ApplicationRecord

  has_one_attached :image
  belongs_to :employee

  validates :title, presence: { message: 'は入力必須です。' }
  validates :body, presence: { message: 'は入力必須です。' }
end
