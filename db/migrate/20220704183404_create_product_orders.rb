class CreateProductOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :product_orders do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :price
      t.integer :making_status

      t.timestamps
    end
  end
end
