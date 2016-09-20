class Player < ActiveRecord::Base
  belongs_to :user
  has_many :games

  validates :name, presence: true
end
