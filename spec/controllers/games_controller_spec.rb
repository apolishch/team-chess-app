require 'rails_helper'

RSpec.describe GamesController, type: :controller do
 #  describe "game#create action" do

 #    it "should successfully create a new game in our database" do
 #      post :create, game: {
 #      name: "New_Game",
 #      }

 #      expect(response).to redirect_to game_path(assigns[:game])

 #      game = Game.last
 #      expect(game.name).to eq("New_Game")
 #    end


 #     it "should properly deal with validation errors" do

 #      post :create, game: {name: '' }
 #      expect(response).to have_http_status(:unprocessable_entity)
 #      expect(Game.count).to eq 0
 #    end
 # end

 # describe "game#show action" do
 #    it "should successfully show the page if the game is found" do
 #       game = FactoryGirl.create(:game)
 #       get :show, id: game.id
 #       expect(response).to have_http_status(:success)
 #    end
 #    it "should return a 404 error if the game is not found" do
 #       get :show, id: 'TACOCAT'
 #       expect(response).to have_http_status(:not_found)
 #    end
 #  end
end