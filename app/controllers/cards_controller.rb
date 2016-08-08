class CardsController < ApplicationController
  def cards
    @cards = Card.find_each
    @terrain_mods = ["atk_mod", "hit_mod", "ev_mod"]
  end
end
