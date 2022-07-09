class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :name
      t.text :caption
      t.date :make_day
      t.boolean :is_active, default: true, null: false
      t.integer :admin_id
      t.string :tag_name

      t.timestamps
    end
  end
end
