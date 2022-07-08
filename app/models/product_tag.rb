class ProductTag < ApplicationRecord

  has_many :product_tags, dependent: :destroy
end
