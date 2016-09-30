class Game < ActiveRecord::Base
  belongs_to :player
  has_many :pieces

  validates :game_title, presence: true
  validates :game_title, uniqueness: true
end
