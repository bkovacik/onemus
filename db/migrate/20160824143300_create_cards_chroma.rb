class CreateCardsChroma < ActiveRecord::Migration
  def change
    create_table :cards_chroma, id: false do |t|
      t.integer :card_id
      t.integer :chroma_id
    end

    add_foreign_key :cards_chroma, :cards
    add_foreign_key :cards_chroma, :chroma
  end
end
