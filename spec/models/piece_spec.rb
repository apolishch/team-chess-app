require 'rails_helper'

  RSpec.describe Piece, type: :model do
    before(:each) do
      @game = Game.create(white_player_id: 1, black_player_id: 1, winning_player_id: 1, player_id: 1, game_title: '', turn: '')
      @dummy_rook_top = Piece.create(type: 'Rook', color: 'black', image: '', x_position: 0, y_position: 1, is_captured: false, game_id: @game.id)
      @dummy_rook_bottom = Piece.create(type: 'Rook', color: 'white', image: '', x_position: 7, y_position: 6, is_captured: false, game_id: @game.id)
      @dummy_pawn_white = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 0, y_position: 3, is_captured: false, game_id: @game.id)
      @dummy_pawn_black = Piece.create(type: 'Pawn', color: 'black', image: '', x_position: 7, y_position: 4, is_captured: false, game_id: @game.id)
            
    end

      describe "obstructions" do

        it "should return false if the vertical move is not blocked moving from top to bottom of the board" do
          expect(@dummy_rook_top.vertical_obstructed?(0,2)).to eql(false)
        end

        it "should return true if the vertical move is blocked moving from top to bottom of the board" do
          expect(@dummy_rook_top.vertical_obstructed?(0,4)).to eql(true)
        end

        it "should return false if the vertical move is not blocked moving from bottom to top of the board" do
          expect(@dummy_rook_bottom.vertical_obstructed?(7,5)).to eql(false)
        end

        it "should return true if the vertical move is blocked moving from bottom to top of the board" do
          expect(@dummy_rook_bottom.vertical_obstructed?(7,3)).to eql(true)
        end
        
      end
end

