class Player < ApplicationRecord
  has_one :game
  has_one :user
end
