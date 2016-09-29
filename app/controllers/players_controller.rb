class PlayersController < ApplicationController


  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.create(player_params)
    redirect_to new_game_path
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

end
