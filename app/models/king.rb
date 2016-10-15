class King < Piece
  # defining the king move as the same as the queen but moving only one square in each direction

  def valid_move?(x, y)
    (horizontal?(x, y) || vertical?(x, y) || diagonal?(x, y)) && squares_moved(x, y) == 1 && super
  end
end
