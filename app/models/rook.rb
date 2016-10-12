class Rook < Piece
  # defining rook move as a piece that advances either vertically or horizontally but never both at a time

  def valid_move?(x, y)
    (vertical?(x, y) || horizontal?(x, y)) && super
  end

  def can_castle?
    
  end

  def castle
    self.can_castle?
    self.move_to
  end

  def castle_king_side_check
    king = Piece.where(type: 'King', color: self.color)
    where_is_king = ''
    if king.x_position > self.x_position
      where_is_king = 'right'
    else
      where_is_king = 'left'
    end
  end
end
