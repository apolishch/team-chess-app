class Pawn < Piece
  # it can only move vertically one square

  def valid_move?(x, y)
    (x_position - x).zero? && advancing?(y) && (y - y_position).abs == first_move.to_s.to_i && super
  end
  # method to define if the pawn movement is of advance

  def valid_pawn_capture?(x, y)
    if x == x_position + 1 || x == x_position - 1
      if color == 'black'
        return true if y == y_position + 1
      else
        return true if y == y_position - 1
      end
    end
    false
  end

  def advancing?(y)
    if color == 'black'
      return true if y_position < y
    elsif y_position > y
      return true
    end
      else return false
  end

  # method to define how many squares can the pawn get moved depending on if it is in its starting square or not

  def first_move
    if color == 'black'
      if y_position == 1
        return 2
      else
        return 1
      end
    elsif y_position == 6
      return 2
    else
      return 1
    end
  end
   # to be defined diagonal move when capturing other piece
 end
