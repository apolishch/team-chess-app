require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'common restrictions to all pieces' do
    it 'should move inside of the limits of the board' do
      dummy_king = Piece.create(type: 'King', color: 'black', image: '', x_position: 4, y_position: 0, is_captured: false, game_id: 0)
      expect(dummy_king.inside_limits?(4, 4)).to eql(true)
      expect(dummy_king.inside_limits?(8, 4)).to eql(false)
    end

    it 'should make a move to a square different than the current one' do
      dummy_king = Piece.create(type: 'King', color: 'black', image: '', x_position: 4, y_position: 0, is_captured: false, game_id: 0)
      expect(dummy_king.moved?(4, 0)).to eql(false)
      expect(dummy_king.moved?(4, 1)).to eql(true)
    end

    #add a capture piece test here
    it 'should capture an opponents piece after a move' do
      dummy_queen = Piece.create(type: 'Queen', color: 'white', image: '', x_position: 3, y_position: 0, is_captured: false, game_id: 0)
      dummy_pawn = Piece.create(type: 'Pawn', color: 'black', image: '', x_position: 4, y_position: 0, is_captured: false, game_id: 0)
      dummy_queen.move_to!(4, 0)
      expect(dummy_pawn.exists?).to eql(false)
    end
    # test that move_to! updates SQL
  end
end
