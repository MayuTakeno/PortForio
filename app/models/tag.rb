class Tag < ApplicationRecord

  has_many :product_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :products, through: :product_tags

  validates :name, presence: true

  def save_tag(sent_tag)
    # タグが存在する場合、タグの名前を配列にして取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # current_tagsから送られた新しいタグ以外をold_tags
    old_tags = current_tags - sent_tags
    # 送信されたタグから現在存在する古いタグ以外をnew_tags
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_product_tag = Tag.find_or_created_by(name: new)
      self.tags << new_product_tag
    end
  end

end
