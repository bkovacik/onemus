class Player < ApplicationRecord
  has_one :game
  has_one :user
  has_many :card_positions
end
