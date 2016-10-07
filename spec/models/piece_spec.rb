require 'rails_helper'

RSpec.describe Piece, type: :model do
  before(:each) do
    @game = FactoryGirl.create :game
    @dummy_rook_top = FactoryGirl.create :piece, type: 'Rook', x_position: 0, y_position: 1, game_id: @game.id
    @dummy_rook_bottom = FactoryGirl.create :piece, type: 'Rook', x_position: 7, y_position: 6, game_id: @game.id
    @dummy_pawn_white = FactoryGirl.create  :piece, type: 'Pawn', x_position: 0, y_position: 3, game_id: @game.id
    @dummy_pawn_black = FactoryGirl.create  :piece, type: 'Pawn', x_position: 7, y_position: 4, game_id: @game.id
    @dummy_rook_left = FactoryGirl.create :piece, type: 'Rook', x_position: 0, y_position: 4, game_id: @game.id
    @dummy_rook_right = FactoryGirl.create :piece, type: 'Rook', x_position: 7, y_position: 4, game_id: @game.id
    @dummy_pawn_white2 = FactoryGirl.create  :piece, type: 'Pawn', x_position: 2, y_position: 4, game_id: @game.id
    @dummy_pawn_white3 = FactoryGirl.create  :piece, type: 'Pawn', x_position: 4, y_position: 4, game_id: @game.id
  end

  

  describe ' vertical obstructions' do
    it 'should return false if the vertical move is not blocked moving from top to bottom of the board' do
      expect(@dummy_rook_top.vertical_obstructed?(0, 2)).to eql(false)
    end

    it 'should return true if the vertical move is blocked moving from top to bottom of the board' do
      expect(@dummy_rook_top.vertical_obstructed?(0, 4)).to eql(true)
    end

    it 'should return false if the vertical move is not blocked moving from bottom to top of the board' do
      expect(@dummy_rook_bottom.vertical_obstructed?(7, 5)).to eql(false)
    end

    it 'should return true if the vertical move is blocked moving from bottom to top of the board' do
      expect(@dummy_rook_bottom.vertical_obstructed?(7, 3)).to eql(true)
    end
  end

  describe 'horizontal obstructions' do
    it 'should return false if the horizontal move is not blocked moving from left to right of the board' do
      expect(@dummy_rook_left.horizontal_obstructed?(1, 4)).to eql(false)
    end

    it 'should return true if the horizontal move is blocked moving from left to right of the board' do
      expect(@dummy_rook_left.horizontal_obstructed?(3, 4)).to eql(true)
    end

    it 'should return false if the horizontal move is not blocked moving from right to left of the board' do
      expect(@dummy_rook_right.horizontal_obstructed?(5, 4)).to eql(false)
    end

    it 'should return true if the horizontal move is blocked moving from right to left of the board' do
      expect(@dummy_rook_right.horizontal_obstructed?(2, 4)).to eql(true)
    end
  end
end
