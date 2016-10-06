require 'rails_helper'

RSpec.describe PiecesController, type: :controller do

  before :each do

    allow_any_instance_of(Game).to receive(:initialize_board).and_return true
  end
end
