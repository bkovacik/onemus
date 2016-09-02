class AddRoomGame < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :rooms, :games
  end
end
