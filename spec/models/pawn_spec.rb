require 'rails_helper'

# to be described behaviour on capturing pieces as the pawn can move diagonally one square to capture

RSpec.describe Pawn, type: :model do
  describe "pawn basic movement" do
    it "should move just one square advancing" do
      dummy_pawn_white = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 1, y_position: 4, is_captured: false, game_id: 0)
      dummy_pawn_black = Piece.create(type: 'Pawn', color: 'black', image: '', x_position: 1, y_position: 3, is_captured: false, game_id: 0)
      dummy_pawn_white_starting = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 1, y_position: 6, is_captured: false, game_id: 0)
      expect(dummy_pawn_black.right_move?(1,2)).to eql(false)
      expect(dummy_pawn_white.right_move?(1,3)).to eql(true)
      expect(dummy_pawn_white.right_move?(1,5)).to eql(false)
      expect(dummy_pawn_black.right_move?(1,4)).to eql(true)
      expect(dummy_pawn_white_starting.right_move?(1,4)).to eql(true)
    end
  end
end