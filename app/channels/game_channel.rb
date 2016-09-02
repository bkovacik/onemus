# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    @r_id = params[:room]
    stream_from "game:#{@r_id}:#{u_id}"

    # Place user in room and link them to a player
    UsersRooms.create(user_id: u_id, room_id: @r_id) 
    player = Player.find_or_create_by(user_id: u_id) 
    User.find(u_id).update_columns(player_id: player.id)

    if UsersRooms.where(room_id: @r_id).count == Room.find(@r_id).capacity
      start_game
    end
  end
  def unsubscribed
    UsersRooms.where(user_id: u_id).destroy_all
    User.find(u_id).update_columns(player_id: nil) 

    game = Game.find_by(room_id: @r_id)
    player = Player.find_by(user_id: u_id)
    players = Player.where(game_id: game.id)

    if game.turn_player_id == player.id
      if players.count == 1
        game.update_columns(turn_player_id: nil)
      else
        advance_turn(game)
      end
    end
    player.destroy

    if players.empty?
      Room.find_by(game_id: game.id).update_columns(game_id: nil)
      Game.where(id: game.id).destroy_all
    end
  end
  def ping(data)
    data.symbolize_keys!
    GameChannel.broadcast_to(
      "#{@r_id}:#{u_id}",
      message: data[:message]
    )
  end
  def advance_phase
    game = Game.find_by(room_id: @r_id)
    if game.phase_id == Phase.maximum(:id)
      game.update_columns(phase_id: Phase.minimum(:id))
      advance_turn(game)
    else
      game.update_columns(phase_id: game.phase_id+1)
    end
  end

  private
    def advance_turn(game)
      players = Player.where(game_id: game.id)
      curr_player = players.find(game.turn_player_id)

      if players.find_by(order: players.maximum(:order)).id == curr_player.id
        game.update_columns(turn_player_id: players.find_by(order: players.minimum(:order)).id, turn: game.turn+1)
      else
        players.find_by(order: curr_player.order+1).id
      end

      game.update_columns(turn_player_id: players.find_by(order: curr_player.order+1).id)
    end
    def start_game
      players = Player.joins({ user: :users_rooms }).where({ users_rooms: { room_id: @r_id }})

      game = Game.find_or_create_by(phase_id: Phase.minimum(:id), turn_player_id: players.find_by(order: players.minimum(:order)).id, room_id: @r_id)

      # Don't start a game if there already is one!
      unless game.turn.nil?
        return
      end

      # Game has started in room. Place players in game.
      Room.find(@r_id).update_columns(game_id: game.id)
      game.update_columns(turn: 1)
      players.update_all(game_id: game.id)

      # Randomize turn order
      order = [*1..players.count].shuffle
      players.each do |player|
        player.update_columns(order: order.pop)
      end
    end
end
