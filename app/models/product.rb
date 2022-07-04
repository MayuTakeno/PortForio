class Product < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :product_order, dependent: :destroy

  # バリデーション
  validates :image, presence: true
  validates :name, presence: true
  validates :caption, presence: true
  validates :with_tax_price, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  # 画像情報有無の処理
  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end

  # 税込み価格
  def with_tax_price
    (price * 1.1).floor
  end

end
