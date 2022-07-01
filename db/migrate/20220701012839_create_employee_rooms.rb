class CreateEmployeeRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_rooms do |t|
      t.integer :employee_id
      t.integer :room_id

      t.timestamps
    end
  end
end
