class Event < ApplicationRecord

  has_one_attached :image

  belongs_to :admin

  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags, dependent: :destroy
  # バリデーション
  validates :title, presence: { message: "は入力必須項目です" }
  validates :body, presence: { message: "は入力必須項目です" }
  validates :organizer, presence: { message: "は入力必須項目です" }
  validates :image, presence: { message: "は入力必須項目です" }

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

  def save_tag(sent_tags)
    # タグの間にスペースを置いてもタグに加算されるようにする
    stripped_tag_names = sent_tags.map(&:strip)
    # 既存タグを全て消す
    self.tags.destroy
    # 新しいタグを保存
    new_tags = stripped_tag_names.map { |tag_name| Tag.find_or_create_by(tag_name: tag_name) }
    # new_tagsを既存タグに代入する
    self.tags = new_tags
  end

end
