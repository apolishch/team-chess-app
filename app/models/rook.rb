class Rook < Piece
  # defining rook move as a piece that advances either vertically or horizontally but never both at a time

  def valid_move?(x, y)
    (vertical?(x, y) || horizontal?(x, y)) && super
  end

  def can_castle?
  end

  def castle
    can_castle?
    move_to
  end

  def castle_king_side_check
    king = Piece.where(type: 'King', color: color)
    where_is_king = ''
    where_is_king = if king.x_position > x_position
                      'right'
                    else
                      'left'
                    end
  end
end
