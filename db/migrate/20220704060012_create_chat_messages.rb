class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.integer :chat_id
      t.integer :employee_id
      t.text :message

      t.timestamps
    end
  end
end
