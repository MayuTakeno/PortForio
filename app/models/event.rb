class Event < ApplicationRecord

  has_one_attached :image
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :organizer, presence: true
  validates :image, presence: true
  validates :date_and_time, presence: true

  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end
end
