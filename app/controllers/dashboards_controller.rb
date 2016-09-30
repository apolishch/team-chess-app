class DashboardsController < ApplicationController
  def show
    @games = find_current_player.games
    @all_games = Game.all
  end
end
