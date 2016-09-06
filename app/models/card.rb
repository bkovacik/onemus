class Card < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :type
  has_many :cards_chroma
  has_many :chroma, through: :cards_chroma
  has_many :card_positions
end
