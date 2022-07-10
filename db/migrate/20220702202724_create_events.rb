class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.integer :hold_status
      t.string :organizer
      t.datetime :date_and_time
      t.integer :admin_id
      t.string :name_tag

      t.timestamps
    end
  end
end
