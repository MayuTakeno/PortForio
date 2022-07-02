class Event < ApplicationRecord

  has_one_attached :image
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true

  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end
end
