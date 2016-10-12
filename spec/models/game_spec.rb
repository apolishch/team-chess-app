require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'initilize_game method' do
    it '' do
      game = FactoryGirl.create(:game_with_initialize)
      expect(Piece.all.count).to eql 32
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

  describe 'validate the is_game_in_check method' do
    it 'return true if the game is in check' do
      game = FactoryGirl.create(:game)
      king = FactoryGirl.create(:king, game_id: game.id, x_position: 4, y_position: 6, color: 'black')
      rook = FactoryGirl.create(:rook, game_id: game.id, x_position: 4, y_position: 4, color: 'white')
      opponets_color = rook.color
      expect(game.is_game_in_check?(opponets_color)).to eql true
    end

    it 'return false if the game is not in check' do
      game = FactoryGirl.create(:game)
      king = FactoryGirl.create(:king, game_id: game.id, x_position: 4, y_position: 6, color: 'black')
      rook = FactoryGirl.create(:rook, game_id: game.id, x_position: 5, y_position: 4, color: 'white')
      opponets_color = rook.color
      expect(game.is_game_in_check?(opponets_color)).to eql false
    end
  end
end
