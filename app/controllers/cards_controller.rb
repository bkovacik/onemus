class CardsController < ApplicationController
  def create
    @card = Card.new(@user_params)

    unless @card.save
      flash[:messages] ||= []
      flash[:messages] += @card.errors.messages.values.flatten
    end

    redirect_to "/cards/new"
  end
  def destroy
    CardsChroma.where({card_id: params[:id]}).destroy_all
    Card.find(params[:id]).destroy

    redirect_to "/cards", status: "303"
  end
  def edit
    @card = Card.find(params[:id])
  end
  def index
    @cards = Card.all
    @terrain_mods = ["atk_mod", "hit_mod", "ev_mod"]
  end
  def new
    @card = Card.new
  end
  def update
    set_uparams
    @card = Card.find(params[:id])

    unless @card.update(@user_params)
      flash[:messages] ||= []
      flash[:messages] += @card.errors.messages.values.flatten
      redirect_to "/cards/new"
    end

    redirect_to "/cards"
  end

  private
    before_action :set_vars
    before_action :require_card_privs
    skip_before_action :require_card_privs, only: [:index]

    def set_vars
      @chroma_map = Chroma.all.map { |c| [c.name.capitalize, c.id] }
      @type_map = Type.all.map { |t| [t.name.capitalize, t.id] }
      unless params[:card].nil?
        @user_params = params.require(:card).permit(:name, :type_id, :ability, :atk_mod, :hit_mod, :ev_mod, :race, :profession, :hp, :atk, :cost, chroma_ids: [])
      end
    end
    def require_card_privs
      unless session[:card]
        flash[:messages] ||= []
        flash[:messages] << "Insufficient card privileges."
        redirect_to "/cards"
      end
    end
end
