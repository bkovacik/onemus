class AddUserPlayer < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :users, :players
  end
end
