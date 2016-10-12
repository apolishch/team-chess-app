require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      player = FactoryGirl.create(:player)
      sign_in player.user
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
