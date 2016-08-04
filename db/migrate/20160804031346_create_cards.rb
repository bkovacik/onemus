class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type
      t.string :name
      t.string :cost
      t.string :race
      t.string :profession
      t.string :ability
      t.json :j_ability
      t.integer :atk
      t.integer :hp
      t.integer :atk_mod
      t.integer :hit_mod
      t.integer :ev_mod

      t.timestamps 
    end
  end
end
