class Bishop < Piece

  # defining bishop move as a piece that advances as many squares vertically than horizontally
  
  def valid_move?(x, y)
    self.moved?(x,y) && self.inside_limits?(x,y) && self.diagonal?(x,y)
  end

end
