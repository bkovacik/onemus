class CardsController < ApplicationController
  def add_cards
    @card_map = Type.all.map { |t| [t.name.capitalize, t.id] }
  end
  def create_card
    user_params = params.require(:create_card).permit(:name, :type_id, :ability, :atk_mod, :hit_mod, :ev_mod, :race, :profession, :hp, :atk, :cost)
    @card = Card.new(user_params)

    unless @card.save
      flash[:messages] ||= []
      flash[:messages] += @card.errors.messages.values.flatten
      redirect_to "/cards/add_cards"
    end
  end
  def view_cards
    @cards = Card.all
    @terrain_mods = ["atk_mod", "hit_mod", "ev_mod"]
  end
end
