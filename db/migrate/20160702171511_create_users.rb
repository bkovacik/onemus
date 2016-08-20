class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password_digest
      t.boolean :card_access, null: false, default: false

      t.timestamps
    end
  end
end
