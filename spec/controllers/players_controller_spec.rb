require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "player#create action" do

    it "should successfully create a new player in our database" do
      game = FactoryGirl.create(:game)
      player = FactoryGirl.create(:player)
      expect(response).to redirect_to game_path(assigns[:game])

      player = Player.last
      expect(player.name).to eq("new_player")
    end

  end
end
