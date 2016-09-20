require 'rails_helper'

RSpec.describe Rook, type: :model do

  before(:each) do
    @dummy_rook = Piece.create(type: 'Rook', color: 'black', image: '', x_position: 0, y_position: 0, is_captured: false, game_id: 0)
  end

  describe "king valid movement" do

    it "should be allowed to move horizontally" do
      expect(@dummy_rook.valid_move?(5,0)).to eql(true)
    end

    it "should be allowed to move vertically" do
      expect(@dummy_rook.valid_move?(0,5)).to eql(true)
    end

    it "shouldn't be allowed to move in diagonal" do
      expect(@dummy_rook.valid_move?(6,3)).to eql(false)
    end

    it "shouldn't be allowed to teleport randomly" do
      expect(@dummy_rook.valid_move?(7,7)).to eql(false)
    end

    it "shouldn't be allowed to not to move" do
      expect(@dummy_rook.valid_move?(0,0)).to eql(false)
    end

    it "shouldn't be allowed to move out of the limits of the board" do
      expect(@dummy_rook.valid_move?(8,8)).to eql(false)
    end
  
  end

end
