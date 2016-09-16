class Player < ActiveRecord::Base
    
    has_one :user
    has_many :games
end
