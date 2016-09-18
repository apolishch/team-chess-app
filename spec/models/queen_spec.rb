require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe "queen basic movement" do
    it "should move either horizontally or vertically or move diagonally" do
      dummy_queen = Piece.create(type: 'Queen', color: 'black', image: '', x_position: 3, y_position: 0, is_captured: false, game_id: 0)
      expect(dummy_queen.valid_move?(0,5)).to eql(false)
      expect(dummy_queen.valid_move?(3,5)).to eql(true)
      expect(dummy_queen.valid_move?(1,0)).to eql(true)
      expect(dummy_queen.valid_move?(7,4)).to eql(true)
      expect(dummy_queen.valid_move?(1,2)).to eql(true)
    end
  end
end

