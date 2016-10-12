class Knight < Piece
  def valid_move?(x, y)
    # to be defined
  end

  def image
    if self.color == "black"
      "&#9822;"
    else
      "&#9816;"
    end
  end
end