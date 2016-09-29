require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "player#create action" do

    it "should successfully create a new player in our database" do
      player = FactoryGirl.create(:player)
      player = Player.last
      expect(player.name).to eq("Foo")
    end

  end
end
