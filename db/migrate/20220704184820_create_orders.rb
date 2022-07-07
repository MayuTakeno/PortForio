class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :employee_id
      t.integer :payment_method
      t.integer :delivery_time
      t.integer :billing_amount
      t.integer :postage
      t.integer :status
      t.string :name
      t.string :phone_number
      t.string :contact
      t.string :email
      t.date :delivery_date
      t.timestamps
    end
  end
end
