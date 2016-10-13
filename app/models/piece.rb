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

  # method to determine if a piece is capturable
  def capturable?(x, y)
    @opponent_piece = Piece.where(:game_id => game_id, :x_position => x, :y_position => y, :is_captured => false).where.not(color: color).first
    @opponent_piece.present?
  end

  # PLACEHOLDER method to determine if a player piece is obstructed to use with the move_to! method
  def is_obstructed?
    return false 
  end

  # method to take X and y for location, then validates the move. if it gets to a piece, capture it.
  def move_to!(x, y)
    if valid_move?(x, y) == true && is_obstructed? == false      
      if capturable?(x, y)
        @opponent_piece.update_attributes(:x_position => nil, :y_position => nil, :is_captured => true)
      end
      update_attributes(:x_position => x, :y_position => y)
      return true
    else
      return false
    end
  end
end


