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

  def y_min(y)
    [y_position, y].min
  end

  def x_min(x)
    [x_position, x].min
  end

  def y_max(y)
    [y_position, y].max
  end

  def x_max(x)
    [x_position, x].max
  end

  def is_obstructed?(x, y)
    if vertical?(x, y)
      vertical_obstructed?(x, y)
    elsif horizontal?(x, y)
      horizontal_obstructed?(x, y)
    elsif diagonal?(x, y)
      diagonal_obstructed?(x, y)
    end
  end

  # method to check if the piece move is vertically obstructed

  def vertical_obstructed?(x, y)
    (y_min(y)...y_max(y)).each do |y|
      game.pieces.where('x_position = ? and y_position >= ? and y_position <= ?', x, y_min(y), y_max(y)).each do |piece|
        if (piece.x_position == x && piece.y_position == y) && piece.id != id
          return true
        end
      end
    end
    false
  end

  # method to check if the piece move is horizontally obstructed

  def horizontal_obstructed?(x, y)
    (x_min(x)...x_max(x)).each do |x|
      game.pieces.where('y_position = ? and x_position >= ? and x_position <= ?', y, x_min(x), x_max(x)).each do |piece|
        if (piece.y_position == y && piece.x_position == x) && piece.id != id
          return true
        end
      end
    end
    false
  end

  # method to check if the piece move is diagonally obstructed

  def diagonal_obstructed?(x, y)
    x_diff = x - x_position
    y_diff = y - y_position
    x_init = x_position
    y_init = y_position

    if x_diff > 0 && y_diff < 0
      direction = 'SN-WE'
    elsif x_diff > 0 && y_diff > 0
      direction = 'NS-WE'
    elsif x_diff < 0 && y_diff < 0
      direction = 'SN-EW'
    elsif x_diff < 0 && y_diff > 0
      direction = 'NS-EW'
  end

    case direction
      # case when the diag move goes from south to north and to west to east of the board
    when 'SN-WE'
      while x_init < x && y_init > y
        game.pieces.each do |piece|
          if piece.x_position == x_init && piece.y_position == y_init && piece.id != id
            return true
          end
        end
        y_init -= 1
        x_init += 1
        end
      false

      # case when the diag move goes from north to south and to west to east of the board
    when 'NS-WE'
      while x_init < x && y_init < y
        game.pieces.each do |piece|
          if piece.x_position == x_init && piece.y_position == y_init && piece.id != id
            return true
          end
        end
        y_init += 1
        x_init += 1
          end
      false

      # case when the diag move goes from south to north and from east to west of the board
    when 'SN-EW'
      while x_init > x && y_init > y
        game.pieces.each do |piece|
          if piece.x_position == x_init && piece.y_position == y_init && piece.id != id
            return true
          end
        end
        y_init -= 1
        x_init -= 1
          end
      false

      # case when the diag move goes from north to south and from east to west of the board
    when 'NS-EW'
      while x_init > x && y_init < y
        game.pieces.each do |piece|
          if piece.x_position == x_init && piece.y_position == y_init && piece.id != id
            return true
          end
        end
        y_init += 1
        x_init -= 1
          end
      false

    end
    end
end
