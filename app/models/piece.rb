class Piece < ActiveRecord::Base
  belongs_to :game

  DIRECTIONS = %w(diagonal horizontal vertical)

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
    DIRECTIONS.each do |direction|
      if self.send(:"#{direction}?", x, y)
        return self.send(:"#{direction}_obstructed?", x, y)
      end
    end
  end

  # method to check if the piece move is vertically obstructed

  def directionally_obstructed(x, y, master_direction)
    other_direction = (master_direction == 'y') ? 'x' : 'y' 
    master_min = self.send(:"#{master_direction}_min", eval("#{master_direction}"))
    master_max = self.send(:"#{master_direction}_max", eval("#{master_direction}"))
    (master_min..master_max).each do |value|
      game.pieces.where("#{other_direction}_position = ? and #{master_direction}_position >= ? and #{master_direction}_position <= ?", eval("#{other_direction}"), master_min, master_max).each do |piece|
        if (piece.send(":#{other_direction}_position") == eval("#{other_direction}" && piece.send(":#{master_diection}") == eval("#{master_direction}")))
          return true
        end
      end
    end
    false
  end

  def vertical_obstructed?(x, y)
    directionally_obstructed(x, y, "y")   
  end
  # method to check if the piece move is horizontally obstructed

  def horizontal_obstructed?(x, y)
    directionally_obstructed(x, y, "x")
  end

  # method to check if the piece move is diagonally obstructed

  def diagonal_obstructed?(x, y)
    l = lambda do |op1, op2|
      while x_init.send(op1, x) && y_init.send(op2, y)
        game.pieces.each do |piece|
          if piece.x_position == x_init && piece.y_position == y_init && piece.id != id
            return true
          end
        end
        y_init -= 1
        x_init += 1
      end
      false
    end

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
      return l.call(:<, :>)

      # case when the diag move goes from north to south and to west to east of the board
    when 'NS-WE'
      return l.call(:<, :<)

      # case when the diag move goes from south to north and from east to west of the board
    when 'SN-EW'
      return l.call(:>, :>)

      # case when the diag move goes from north to south and from east to west of the board
    when 'NS-EW'
      return l.call(:>, :<)

    end
    end
end
