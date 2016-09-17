class Bishop < Piece

  # defining bishop move as a piece that advances as many squares vertically than horizontally
  
  def right_move?(x, y)
    (x_position-x).abs == (y_position - y).abs
  end

end
