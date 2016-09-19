class Game < ActiveRecord::Base
    validates :name, presence: true
    
    belongs_to :player
    has_many :pieces
end
