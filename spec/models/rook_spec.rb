require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe "rook basic movement" do
    it "should move either horizontally or vertically" do
      dummy_rook = Piece.create(type: 'Rook', color: 'black', image: '', x_position: 0, y_position: 0, is_captured: false, game_id: 0)
      expect(dummy_rook.valid_move?(0,5)).to eql(true)
      expect(dummy_rook.valid_move?(1,5)).to eql(false)
      expect(dummy_rook.valid_move?(5,0)).to eql(true)
    end
  end
end
