class Room < ApplicationRecord
  has_many :users_rooms, class_name: UsersRooms
  has_many :users, through: :users_rooms 
  has_one :game
end
