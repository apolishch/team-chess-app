require 'rails_helper'

RSpec.describe Knight, type: :model do
  before(:each) do
    # @dummy_knight = FactoryGirl.create :piece, type: 'Knight', x_position: 5, y_position: 1, game_id: 0
    @dummy_knight = Piece.create(type: 'Knight', color: 'black', image: '', x_position: 5, y_position: 1, is_captured: false, game_id: 0)
  end

  describe 'knight valid moves' do
    it 'should return true if the move is a proper knight move' do
      expect(@dummy_knight.valid_move?(3, 0)).to eql(true)
      expect(@dummy_knight.valid_move?(3, 2)).to eql(true)
      expect(@dummy_knight.valid_move?(4, 3)).to eql(true)
      expect(@dummy_knight.valid_move?(6, 3)).to eql(true)
      expect(@dummy_knight.valid_move?(7, 2)).to eql(true)
      expect(@dummy_knight.valid_move?(7, 0)).to eql(true)
    end

    it 'should return false if the move is a diagonal move' do
      expect(@dummy_knight.valid_move?(2, 4)).to eql(false)
    end

    it 'should return false if the move is a horizontal move' do
      expect(@dummy_knight.valid_move?(2, 1)).to eql(false)
    end

    it 'should return false if the move is a vertical move' do
      expect(@dummy_knight.valid_move?(5, 4)).to eql(false)
    end

    it "shouldn't be allowed to teleport randomly" do
      expect(@dummy_knight.valid_move?(7, 7)).to eql(false)
    end

    it "shouldn't be allowed to not to move" do
      expect(@dummy_knight.valid_move?(5, 1)).to eql(false)
    end

    it "shouldn't be allowed to move out of the limits of the board" do
      expect(@dummy_knight.valid_move?(8, 8)).to eql(false)
    end
  end
end
