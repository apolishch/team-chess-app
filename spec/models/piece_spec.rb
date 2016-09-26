    require 'rails_helper'

    

    RSpec.describe Piece, type: :model do
      before(:each) do
        @dummy_rook = Piece.create(type: 'Rook', color: 'white', image: '', x_position: 0, y_position: 4, is_captured: false, game_id: 0)
        @dummy_pawn_white = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 0, y_position: 2, is_captured: false, game_id: 0)
    end

      describe "obstructions" do
        it "should return true if the vertical move is blocked" do
          expect(@dummy_rook.vertical_obstructed?(0,1)).to eql(true)
        end
      end
      
    end
