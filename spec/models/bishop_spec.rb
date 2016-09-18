require 'rails_helper'

RSpec.describe Bishop, type: :model do
  describe "bishop basic movement" do
    it "should move the same number of squares horizontally and vertically" do
      dummy_bishop = Piece.create(type: 'Bishop', color: 'black', image: '', x_position: 2, y_position: 0, is_captured: false, game_id: 0)
      expect(dummy_bishop.valid_move?(3,1)).to eql(true)
      expect(dummy_bishop.valid_move?(3,2)).to eql(false)
      
    end
  end
end
