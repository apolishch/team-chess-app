class Pawn < Piece

  # it can only move vertically one square
  def valid_move?(x,y)
    self.moved?(x,y) && (x_position - x == 0) && advancing?(y) && (y-y_position).abs == "#{first_move}".to_i
  end
  # method to define if the pawn movement is of advance
  def advancing?(y)
    #(color == 'black' && y_position < y) || (color == 'white' && y_position > y)
    
    if color == 'black' 
      if y_position < y 
        return true
      end
    elsif  y_position > y 
      return true
    end
      else return false
  end

  # method to define how many squares can the pawn get moved depending on if it is in its starting square or not
  
  def first_move
     
  if color == 'black' 
    if  y_position == 1 
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
