# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    UsersRooms.create(user_id: User.find_by(username: u_id).id, room_id: params[:room]) 

    stream_from "game:#{params[:room]}:#{u_id}"
  end
  def unsubscribed
    UsersRooms.where(user_id: User.find_by(username: u_id).id).destroy_all
  end
  def ping
    GameChannel.broadcast_to(
      "1:#{u_id}",
      message: "PING!"
    )
  end
end
