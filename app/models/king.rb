class King < Piece

  # defining the king move as the same as the queen but moving only one square in each direction 

  def right_move?(x,y)
    
   ((x_position - x == 0 || y_position - y == 0) || ((x_position-x).abs == (y_position - y).abs)) && ((x_position-x).abs <=1 && (y_position-y).abs <= 1 )
  
  end

end
