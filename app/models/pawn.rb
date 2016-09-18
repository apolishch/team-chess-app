class Pawn < Piece

  # it can only move vertically one square
  def right_move?(x,y)
    (x_position - x == 0) && advancing?(y) && (y-y_position).abs == "#{first_move}".to_i
  end
  # method to define if the pawn movement is of advance
  def advancing?(y)
    (color = 'black' && y_position < y) || (color = 'white' && y_position > y)
  end

  # method to define how many squares can the pawn get moved depending on if it is in its starting square or not
  def first_move
    if (color = 'black' && y_position = 1) || (color = 'white' && y_position = 6)
      return 2
    else
      return 1
    end
  end

  # to be defined diagonal move when capturing other piece
 
end
