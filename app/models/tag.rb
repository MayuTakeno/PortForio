class Tag < ApplicationRecord

  has_many :product_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :products, through: :product_tags

  validates :tag_name, presence: true

end
