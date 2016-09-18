class King < Piece

  # defining the king move as the same as the queen but moving only one square in each direction 

  def valid_move?(x,y)

    x_diff = x_position - x
    y_diff = y_position - y
    
   (self.horizontal?(x,y) || self.vertical?(x,y) || self.diagonal?(x,y)) && ((x_diff).abs <=1 && (y_diff).abs <= 1 ) && self.moved?(x,y) && self.inside_limits?(x,y)
  
  end

end

