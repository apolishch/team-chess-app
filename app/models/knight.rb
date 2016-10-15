class Knight < Piece
  # defines the valid move of the knight as a move that covers 3 squares not being a vertical neither an horizontal or diagonal  move
  def valid_move?(x, y)
    !horizontal?(x, y) && !vertical?(x, y) && !diagonal?(x, y) && squares_moved(x, y) == 3 && super
  end
end
