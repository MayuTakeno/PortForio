class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :admin

  has_many :cart_items, dependent: :destroy
  has_many :product_orders, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags

  # バリデーション
  validates :image, presence: true
  validates :name, presence: true
  validates :caption, presence: true
  validates :price, presence: true
  validates :make_day, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  # 画像情報有無の処理
  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end

  # 販売状態を求める記述
  # def get_is_active
  #   if is_active = true
  #     "販売中"
  #   else
  #     "販売終了"
  #   end
  # end

  # 税込み価格
  def with_tax_price
    (price * 1.1).floor
  end

  def save_tag(sent_tags)
    # タグが存在する場合、タグの名前を配列にして取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # current_tagsから送られた新しいタグ以外をold_tags
    old_tags = current_tags - sent_tags
    # 送信されたタグから現在存在する古いタグ以外をnew_tags
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_product_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_product_tag
    end
  end

end
