class Order < ApplicationRecord

  belongs_to :employee

  has_many :product_orders, dependent: :destroy
  has_many :product, through: :product_orders

  # enum_helper
  # 0: receive_counter, 1: take
  enum payment_method: { receive_counter: 0, delivery: 1 }
  # 0: no_payment, 1: confirm_payment, 2: production, 3: ready_to_ship, 4: sent
  enum status: {no_payment: 0, confirm_payment: 1, production: 2, ready_to_ship: 3, sent: 4 }

  # 商品の合計金額
  def total_items
    sum = 0
      product_orders.each do |product_order|
        sum += product_order.price * product_order.quantity
      end
    sum
  end

  def postage
    200
  end

end
