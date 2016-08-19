class CardsController < ApplicationController
  def add_cards
    @card_map = Card.descendants.map { |c| [c.name.demodulize, c.name.demodulize.downcase] }
    @card_map.sort! { |a, b| a[1] <=> b[0] }
  end
  def create_card
    print params, "%"
    user_params = params.require(:create_card).permit(:name, :ability, :atk_mod, :hit_mod, :ev_mod, :race, :hp, :atk, :cost)
    @card = params[:create_card][:type].capitalize.constantize.new(user_params)

    unless @card.save
      flash[:messages] += @card.errors.messages.values.flatten
      redirect_to "/cards/add_cards"
    end
  end
  def view_cards
    @cards = Card.find_each
    @terrain_mods = ["atk_mod", "hit_mod", "ev_mod"]
  end
end
