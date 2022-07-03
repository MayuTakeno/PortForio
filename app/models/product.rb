class Product < ApplicationRecord
  has_one_attached :image

  # バリデーション
  validates :caption, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true

  # 画像情報有無の処理
  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end

  # 税込み価格
  def add_tax_price
    (self.price * 1.10).round
  end

end
