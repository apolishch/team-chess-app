class Rook < Piece
  # defining rook move as a piece that advances either vertically or horizontally but never both at a time

  def valid_move?(x, y)
    (vertical?(x, y) || horizontal?(x, y)) && super
  end
end
