class CreateCardPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :card_positions do |t|
      t.integer :player_id
      t.integer :card_id
      t.integer :zone_id
      t.integer :location_x
      t.integer :location_y
      t.integer :order

      t.timestamps
    end

    add_foreign_key :card_positions, :players
    add_foreign_key :card_positions, :cards
    add_foreign_key :card_positions, :zones
  end
end
