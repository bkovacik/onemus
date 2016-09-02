class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.string :name
    end
  end
end
