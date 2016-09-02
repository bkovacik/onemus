class Game < ApplicationRecord
  has_one :phase
  
  belongs_to :player
  belongs_to :room
end
