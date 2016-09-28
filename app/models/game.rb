class Game < ActiveRecord::Base
<<<<<<< HEAD

    belongs_to :user, foreign_key: :player_id
    has_many :pieces
    
     
=======
  belongs_to :player
  has_many :pieces
>>>>>>> origin/master
end
