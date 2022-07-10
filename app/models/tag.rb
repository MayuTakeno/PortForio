class Tag < ApplicationRecord
  # product用タグ
  has_many :product_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :products, through: :product_tags
  # event用タグ
  has_many :event_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :events, through: :event_tags

  validates :tag_name, presence: true, uniqueness: true



end
