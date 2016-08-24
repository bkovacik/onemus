class CardsChroma < ActiveRecord::Base
  self.table_name = :cards_chroma
  self.primary_key  = :card_id

  belongs_to :cards
  belongs_to :chroma
end
