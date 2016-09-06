class CardPosition < ApplicationRecord
  belongs_to :players
  belongs_to :cards
  belongs_to :zones
end
