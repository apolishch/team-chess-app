require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'game#new action' do
    it 'should prompt user to create a player' do
      user = FactoryGirl.create(:user)
      sign_in user
      get :new
      expect(response).to redirect_to new_player_path
    end

    it 'should allow users with a player name to go to the create new game screen' do
      user = FactoryGirl.create(:player)
      sign_in user.user
      get :new
      expect(response).to be_success
    end
  end

  describe 'game#index action' do
    it 'should successfully list open games' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'game#show action' do
    it 'should successfully show a requested game' do
      game = FactoryGirl.create(:game)
      get :show, id: game.id
      expect(response).to have_http_status(200)
    end
  end

  describe 'game#create action' do
    it 'should successfully create a new game and add to database' do
      game = FactoryGirl.create(:game)
      expect(game.id).to eq(Game.last.id)
    end

     #describe initalize board
     #use the factory above
    it 'should successfully place the pieces of the game on the board' do
      game = FactoryGirl.create(:game)
      expect(game.pieces.count).to eq 32
    end

     #describe return piece
    it 'creates a white Rook' do
      game = FactoryGirl.create(:game)
      expect(game.pieces(color: 'white').find_by(x_position: 1, y_position: 0)).to be_a Knight
    end

  end


end
