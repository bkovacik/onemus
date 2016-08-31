class UsersRooms < ApplicationRecord
  self.primary_key = :user_id

  belongs_to :users
  belongs_to :rooms
end
