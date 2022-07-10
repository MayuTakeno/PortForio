class Event < ApplicationRecord

  has_one_attached :image

  belongs_to :admin

  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags
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
    # tagが存在する場合、タグの名前を配列にして取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # current_tagsから送られた新しいタグ以外をold_tags
    old_tags = current_tags - sent_tags
    # sent_tagsから送られた現在存在するタグ以外をnew_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_event_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_event_tag
    end
  end

end
