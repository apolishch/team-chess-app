class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = current_user.create_player(player_params)
    redirect_to root_path
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
