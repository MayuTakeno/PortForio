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
    # タグの間にスペースを置いても加算されるようにする処理
    stripped_tag_names = sent_tags.map(&:strip) # sent_tags.map { |tag| tag.strip }

    # 既存タグを消す
    self.tags.destroy_all
    # 新しいタグを保存
    # sent_tags.each do |tag|
    #   product_tag = Tag.find_or_create_by(tag_name: tag)
    #   self.tags << product_tag
    # end
    new_tags = stripped_tag_names.map { |tag_name| Tag.find_or_create_by(tag_name: tag_name) }
    self.tags = new_tags
  end

end
