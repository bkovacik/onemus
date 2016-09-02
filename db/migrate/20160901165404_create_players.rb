class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :order

      t.timestamps
    end
  end
end
