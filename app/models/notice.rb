class Notice < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true

  # 画像情報有無の分岐処理
  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end

end
