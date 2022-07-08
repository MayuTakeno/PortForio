class Tag < ApplicationRecord

  has_many :product_tags, dependent: :destroy
  
end
