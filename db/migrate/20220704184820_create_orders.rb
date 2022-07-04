class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :employee_id
      t.integer :payment_method
      t.integer :total
      t.integer :status
      t.string :name
      t.string :employee_code
      t.string :assigned_to

      t.timestamps
    end
  end
end
