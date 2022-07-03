class Product < ApplicationRecord

  def price_add_tax
    (self.price * 1.1).round
  end

end
