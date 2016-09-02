class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :phase_id
      t.integer :turn_player_id
      t.integer :room_id
      t.integer :turn

      t.timestamps
    end

    add_foreign_key :games, :phases
    add_foreign_key :games, :players, column: :turn_player_id
    add_foreign_key :games, :rooms
  end
end
