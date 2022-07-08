class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :employee

  # 小計を求める記述
  def sub_total
    product.with_tax_price * quantity
  end
end
