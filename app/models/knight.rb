class Knight < Piece
  def valid_move?(x, y)
    # to be defined
  end
end

  def image
    if self.color == "black"
      "&#9821;"
    else
      "&#9822;"
    end
  end