class Chroma < ActiveRecord::Base
  self.table_name = :chroma

  has_many :cards_chroma
  has_many :cards, through: :cards_chroma
end
