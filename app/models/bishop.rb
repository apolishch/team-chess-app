class Bishop < Piece
  # defining bishop move as a piece that advances as many squares vertically than horizontally

  def valid_move?(x, y)
    diagonal?(x, y) && super
  end


  def image
    if self.color == "black"
      "&#9821;"
    else
      "&#9815;"
    end
  end

end