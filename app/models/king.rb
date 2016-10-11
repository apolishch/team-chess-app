class King < Piece
  # defining the king move as the same as the queen but moving only one square in each direction

  def valid_move?(x, y)
    x_diff = x_position - x
    y_diff = y_position - y

    (horizontal?(x, y) || vertical?(x, y) || diagonal?(x, y)) && (x_diff.abs <= 1 && y_diff.abs <= 1) && super
  end
end



  def image
    if self.color == "black"
      "&#9818;"
    else
      "&#9812;"
    end
  end