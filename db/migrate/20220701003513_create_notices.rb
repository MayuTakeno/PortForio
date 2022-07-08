class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|

      t.string :title
      t.text :body
      t.text :caption
      t.integer :admin_id

      t.timestamps
    end
  end
end
