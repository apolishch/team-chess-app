require 'rails_helper'

RSpec.describe Pawn, type: :model do

# to be described behaviour on capturing pieces as the pawn can move diagonally one square to capture
  before(:each) do
    @dummy_pawn_white = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 1, y_position: 4, is_captured: false, game_id: 0)
    @dummy_pawn_black = Piece.create(type: 'Pawn', color: 'black', image: '', x_position: 1, y_position: 3, is_captured: false, game_id: 0)
    @dummy_pawn_white_starting = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 1, y_position: 6, is_captured: false, game_id: 0)
  end

  describe "pawn valid_moves" do
    it "should be allowed to move vertically" do
      expect(@dummy_pawn_black.valid_move?(1,4)).to eql(true)
      expect(@dummy_pawn_white.valid_move?(1,3)).to eql(true)
    end

    it "shouldn't be allowed to move horizontally" do
      expect(@dummy_pawn_black.valid_move?(2,3)).to eql(false)
    end

    it "shouldn't be allowed to move diagonally" do
      expect(@dummy_pawn_black.valid_move?(2,3)).to eql(false)
    end

    it "shouldn't be allowed to move more than a square if it is not at the starting positon" do #at least until capturing pieces is defined
      expect(@dummy_pawn_black.valid_move?(1,5)).to eql(false)
    end

    it "should be allowed to move two squares if it is at the starting positon" do
      expect(@dummy_pawn_white_starting.valid_move?(1,4)).to eql(true)
    end

    it "shouldn't be allowed to move backwards" do
      expect(@dummy_pawn_white.valid_move?(1,5)).to eql(false)
      expect(@dummy_pawn_black.valid_move?(1,2)).to eql(false)
    end

    it "shouldn't be allowed to teleport randomly" do
      expect(@dummy_pawn_black.valid_move?(7,7)).to eql(false)
    end

    it "shouldn't be allowed to not to move" do
      expect(@dummy_pawn_black.valid_move?(1,3)).to eql(false)
    end

    it "shouldn't be allowed to move out of the limits of the board" do
      expect(@dummy_pawn_black.valid_move?(8,8)).to eql(false)
    end

  end
end
