class Piece < ActiveRecord::Base
  belongs_to :game

  # method to check if the move is inside the board limits

  def inside_limits?(x, y)
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end

  # method to check if the move is not equal to the current position

  def moved?(x, y)
    x != x_position || y != y_position
  end

  def valid_move?(x, y)
    moved?(x, y) && inside_limits?(x, y)
  end

  # method to check if the movement is diagonal

  def diagonal?(x, y)
    (x_position - x).abs == (y_position - y).abs
  end

  # method to check if the movement is horizontal

  def horizontal?(x, y)
    (y_position - y).zero? && (x_position - x).abs > 0
  end

  # method to check if the movement is vertical

  def vertical?(x, y)
    (x_position - x).zero? && (y_position - y).abs > 0
  end

  # method tp determine if a piece is capturable
  def capturable?(x, y)
    Piece.where(:game_id == game.id, :x_position == x, :y_position == y, :is_captured == false).where(color: != color).present?
  end

  # method to take X and y for location, then validates the move. if it gets to a piece, capture it.
  def move_to!(x, y)  #move must be valid. If valid, move the piece. If no opponent pieces there, end. If capturable piece there, capture it.
    # if valid_move(x, y) == true then move the piece
    
     
      #if a piece of different color exists in destination space, capture that piece (remove it from the board).
    opponent_piece = Piece.where(:game_id == game.id, :x_position == x, :y_position == y)
    if capturable?(x, y)
      opponent_piece.update_attributes(:x_position == nil, :y_position == nil, :is_captured: true)
    end
  end
end

#line
