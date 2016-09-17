class Queen < Piece
  def right_move?(x,y)
    
    #defining the queen move as the combination of the moves for the bishop and the rook

    (x_position - x == 0 || y_position - y == 0) || ((x_position-x).abs == (y_position - y).abs)
  
  end

end
