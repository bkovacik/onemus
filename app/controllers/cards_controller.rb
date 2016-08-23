class CardsController < ApplicationController
  def create
    set_uparams
    @card = Card.new(@user_params)

    unless @card.save
      flash[:messages] ||= []
      flash[:messages] += @card.errors.messages.values.flatten
    end

    redirect_to "/cards/new"
  end
  def edit
    @card = Card.find(params[:id])
    @card_map = Type.all.map { |t| [t.name.capitalize, t.id] }
  end
  def index
    @cards = Card.all
    @terrain_mods = ["atk_mod", "hit_mod", "ev_mod"]
  end
  def new
    @card = Card.new
    @card_map = Type.all.map { |t| [t.name.capitalize, t.id] }
  end
  def update
    set_uparams
    @card = Card.find(params[:id])

    unless @card.update(@user_params)
      flash[:messages] ||= []
      flash[:messages] += @card.errors.messages.values.flatten
      redirect_to "/cards/add_cards"
    end

    redirect_to "/cards"
  end

  private
    def set_uparams
      @user_params = params.require(:card).permit(:name, :type_id, :ability, :atk_mod, :hit_mod, :ev_mod, :race, :profession, :hp, :atk, :cost)
    end
end
