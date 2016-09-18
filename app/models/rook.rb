class Rook < Piece

  # defining rook move as a piece that advances either vertically or horizontally but never both at a time
  
  def valid_move?(x,y)
    (self.vertical?(x,y) || self.horizontal?(x,y)) && self.moved?(x,y) && self.inside_limits?(x,y)
  end

end
