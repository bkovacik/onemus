class GameController < ApplicationController
  def create
    room_params = params.require(:room).permit(:name, :capacity)
    @room = Room.new(room_params)

    unless @room.save
      flash[:messages] ||= []
      flash[:messages] += @room.errors.messages.values.flatten
    end

    redirect_to "/game"
  end
  def index
    @newRoom = Room.new
  end
  def show
  end

  private
    before_action :initVars

    def initVars
      @rooms = Room.all
    end
end
