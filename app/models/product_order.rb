class ProductOrder < ApplicationRecord

  belongs_to :order
  belongs_to :product

  # enum_helper
  # 0: no_making, 1: wait_making, 2: now_making, 3: complete_making
  enum making_status: { no_making: 0, wait_making: 1, now_making: 2, complete_making: 3 }
end

# 小計を求める記述
def sub_total
  product.with_tax_price * quantity
end