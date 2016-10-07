require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'initilize_game method' do
    it '' do
      game = FactoryGirl.create :game_with_initialize_board
      expect(Pawn.where(color: 'black').count).to eql 8
      expect(Pawn.where(color: 'white').count).to eql 8
      expect(Bishop.where(color: 'black').count).to eql 2
      expect(Bishop.where(color: 'white').count).to eql 2
      expect(King.where(color: 'black').count).to eql 1
      expect(King.where(color: 'white').count).to eql 1
      expect(Knight.where(color: 'black').count).to eql 2
      expect(Knight.where(color: 'white').count).to eql 2
      expect(Queen.where(color: 'black').count).to eql 1
      expect(Queen.where(color: 'white').count).to eql 1
      expect(Rook.where(color: 'black').count).to eql 2
      expect(Rook.where(color: 'white').count).to eql 2
    end
  end
end
