class Order < ApplicationRecord

  belongs_to :employee

  has_many :product_orders, dependent: :destroy
  has_many :product, through: :product_orders

  # validates :email, presence: true
  # validates :phone_number, presence: true
  # enum_helper
  # 0: receive_counter, 1: delivery
  enum payment_method: { receive_counter: 0, delivery: 1 }
  # 0: no_payment, 1: confirm_payment, 2: production, 3: ready_to_ship, 4: sent
  enum status: {no_payment: 0, confirm_payment: 1, production: 2, ready_to_ship: 3, sent: 4 }
  # 0: 10:00-12:00, 1: 13:00-15:00, 2: 16:00-18:00
  enum delivery_time: {ten_oclock: 0, thirteen_oclock: 1, sixteen_oclock: 2 }

  def postage
    200
  end

end
