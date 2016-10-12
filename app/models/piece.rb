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
end
