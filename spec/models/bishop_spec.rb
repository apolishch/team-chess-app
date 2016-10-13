require 'rails_helper'

RSpec.describe Bishop, type: :model do
  before(:each) do
    @dummy_bishop = Piece.create(type: 'Bishop', color: 'black', x_position: 2, y_position: 0, is_captured: false, game_id: 0)
  end

  describe 'bishop valid moves' do
    it 'should allow moving diagonally' do
      expect(@dummy_bishop.valid_move?(5, 3)).to eql(true)
    end

    it "shouldn't be allowed to move horizontally" do
      expect(@dummy_bishop.valid_move?(7, 0)).to eql(false)
    end

    it "shouldn't be allowed to move vertically" do
      expect(@dummy_bishop.valid_move?(2, 6)).to eql(false)
    end

    it "shouldn't be allowed to teleport randomly" do
      expect(@dummy_bishop.valid_move?(7, 7)).to eql(false)
    end

    it "shouldn't be allowed to not to move" do
      expect(@dummy_bishop.valid_move?(2, 0)).to eql(false)
    end

    it "shouldn't be allowed to move out of the limits of the board" do
      expect(@dummy_bishop.valid_move?(8, 8)).to eql(false)
    end
  end
end
