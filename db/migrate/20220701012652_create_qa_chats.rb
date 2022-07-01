class CreateQaChats < ActiveRecord::Migration[6.1]
  def change
    create_table :qa_chats do |t|
      t.integer :employee_id
      t.integer :room_id
      t.string :title
      t.string :message

      t.timestamps
    end
  end
end
