class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :employee_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
