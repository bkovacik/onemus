class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

  has_many :users_rooms
  has_many :rooms, through: :users_rooms 
end
