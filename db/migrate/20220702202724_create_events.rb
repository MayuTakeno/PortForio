class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.integer :hold_status
      t.string :organizer
      t.string :date_and_time

      t.timestamps
    end
  end
end
