class Card < ActiveRecord::Base
  validates :ability, presence: true
  validates :name, presence: true, uniqueness: true
end

class Spell < Card
end

class Terrain < Card
  validates :atk_mod, :hit_mod, :ev_mod, presence: true
end

class Hero < Card
  validates :race, :hp, :atk, presence: true
end

class Creature < Hero
  validates :cost, presence: true
end


