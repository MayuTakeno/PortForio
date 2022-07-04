class Event < ApplicationRecord

  has_one_attached :image
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :organizer, presence: true
  validates :image, presence: true
  validates :date_and_time, presence: true

  # enum_helper
  # no_hold: 0, now_hold: 1, postponed: 2, hold_complete: 3
  enum hold_status: { no_hold: 0, now_hold: 1, postponed: 2, hold_complete: 3}

  # 画像情報有無の処理
  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end

end
