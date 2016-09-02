class AddPlayerForeign < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :players, :games
    add_foreign_key :players, :users
  end
end
