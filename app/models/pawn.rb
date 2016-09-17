class Pawn < Piece

  # it can only move vertically one square
  def right_move?(x,y)
    (x_position - x == 0) && self.advancing?(y) && (y-y_position).abs == 1
  end

  def advancing?(y)
    (color = 'black' && y_position < y) || (color = 'white' && y_position > y)
  end

  # to be defined diagonal move when capturing other piece
  # to be defined pawn can move 2 squares in first move
end
