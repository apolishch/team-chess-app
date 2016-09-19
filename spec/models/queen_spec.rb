require 'rails_helper'


RSpec.describe Queen, type: :model do

    before(:each) do
        @dummy_queen = Piece.create(type: 'Queen', color: 'black', image: '', x_position: 3, y_position: 0, is_captured: false, game_id: 0)
    end

    describe "queen valid moves" do
        it "should be allowed to move horizontally" do
          expect(@dummy_queen.valid_move?(5,0)).to eql(true)
        end

        it "should be allowed to move vertically" do
          expect(@dummy_queen.valid_move?(3,3)).to eql(true)
        end

        it "should be allowed to move in diagonal" do
          expect(@dummy_queen.valid_move?(6,3)).to eql(true)
        end

        it "shouldn't be allowed to teleport randomly" do
            expect(@dummy_queen.valid_move?(7,7)).to eql(false)
        end

        it "shouldn't be allowed to not to move" do
            expect(@dummy_queen.valid_move?(3,0)).to eql(false)
        end

        it "shouldn't be allowed to move out of the limits of the board" do
           expect(@dummy_queen.valid_move?(8,8)).to eql(false)
        end

    end
            
end


