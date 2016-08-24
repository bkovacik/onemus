class CreateChroma < ActiveRecord::Migration
  def change
    create_table :chroma do |t|
      t.string :name

      t.timestamps
    end
  end
end
