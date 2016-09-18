class Piece < ActiveRecord::Base
    
    has_many :games

    # method to check if the move is inside the board limits
    
    def inside_limits?(x,y)
      x >= 0 && x <= 7 && y >= 0 && y <= 7
    end
    
    # method to check if the move is not equal to the current position
    
    def moved?(x,y)
      x != x_position || y!= y_position
    end

    def diagonal?(x,y)
      (x_position-x).abs == (y_position - y).abs
    end

    def horizontal?(x,y)
      y_position - y == 0
    end

    def vertical?(x,y)
      x_position - x == 0
    end
    

end
