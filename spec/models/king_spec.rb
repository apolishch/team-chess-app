require 'rails_helper'

RSpec.describe King, type: :model do

    before(:each) do
        @dummy_king = Piece.create(type: 'King', color: 'black', image: '', x_position: 4, y_position: 0, is_captured: false, game_id: 0)
    end

    describe "king valid moves" do
        it "should be allowed to move horizontally" do
          expect(@dummy_king.valid_move?(5,0)).to eql(true)
        end

        it "should be allowed to move vertically" do
          expect(@dummy_king.valid_move?(4,1)).to eql(true)
        end

        it "should be allowed to move in diagonal" do
          expect(@dummy_king.valid_move?(3,1)).to eql(true)
        end

        it "shouldn't be allowed to move more than one square in any direction" do
          expect(@dummy_king.valid_move?(6,0)).to eql(false)
          expect(@dummy_king.valid_move?(4,5)).to eql(false)
          expect(@dummy_king.valid_move?(7,3)).to eql(false)
        end

        it "shouldn't be allowed to teleport randomly" do
            expect(@dummy_king.valid_move?(7,7)).to eql(false)
        end

        it "shouldn't be allowed to not to move" do
            expect(@dummy_king.valid_move?(4,0)).to eql(false)
        end

        it "shouldn't be allowed to move out of the limits of the board" do
           expect(@dummy_king.valid_move?(8,8)).to eql(false)
        end

    end
  end
     