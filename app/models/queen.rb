class Queen < Piece
  def valid_move?(x, y)
    # defining the queen move as the combination of the moves for the bishop and the rook

    (vertical?(x, y) || horizontal?(x, y) || diagonal?(x, y)) && super
  end
end
