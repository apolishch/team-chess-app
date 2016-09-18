require 'rails_helper'

RSpec.describe King, type: :model do
  describe "king basic movement" do
    it "should move either horizontally or vertically or move diagonally but only one square" do
        dummy_king = Piece.create(type: 'King', color: 'black', image: '', x_position: 4, y_position: 0, is_captured: false, game_id: 0)
        expect(dummy_king.valid_move?(6,2)).to eql(false)
        expect(dummy_king.valid_move?(5,0)).to eql(true)
        expect(dummy_king.valid_move?(4,1)).to eql(true)
        expect(dummy_king.valid_move?(3,1)).to eql(true)
        expect(dummy_king.valid_move?(0,1)).to eql(false)
    end

    end
end
