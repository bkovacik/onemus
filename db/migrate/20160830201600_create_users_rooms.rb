class CreateUsersRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :users_rooms, id: false do |t|
      t.integer :user_id
      t.integer :room_id
    end

    add_foreign_key :users_rooms, :users
    add_foreign_key :users_rooms, :rooms
  end
end
