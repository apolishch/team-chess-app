class Bishop < Piece

  # defining bishop move as a piece that advances as many squares vertically than horizontally
  
  def valid_move?(x, y)
    self.diagonal?(x,y) && super
  end

end
