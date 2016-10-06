class Player < ActiveRecord::Base
  belongs_to :user
  has_many :games

  validates :name, presence: true
  validates :user_id, uniqueness: true
end
