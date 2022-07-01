class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|

      t.string :title
      t.text :body
      t.text :caption

      t.timestamps
    end
  end
end
