class Game < ActiveRecord::Base

    belongs_to :user, foreign_key: :player_id
    has_many :pieces
    
     
end
