require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe 'player#create action' do
    it 'should successfully create a new player in our database' do
      player = FactoryGirl.create(:player)

      expect(player.id).to eq(Player.last.id)
    end
  end
end
