class Card < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :type
end
