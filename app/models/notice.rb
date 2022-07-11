class Notice < ApplicationRecord
  has_one_attached :image

  belongs_to :admin

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

  # 検索方法（部分検索）
  # def self.looks(search, word)
    # if search == "partial_match"
      # @notice = Notice.where("title LIKE?", "%#{word}%")
    # end
  # end

end
