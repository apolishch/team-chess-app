class Rook < Piece

  # defining rook move as a piece that advances either vertically or horizontally but never both at a time
  
  def right_move?(x,y)
    x_position - x == 0 || y_position - y == 0
  end

end
