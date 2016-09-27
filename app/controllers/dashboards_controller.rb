class DashboardsController < ApplicationController

    def show
      @games = Game.all
      @current_player_games = current_player_games
      @opponent_games = opponent_games
      @open_games = open_games
    end

    def current_player_games
      @current_player_games = current_user.games.limit(10)
    end

    def opponent_games
      # is partcipating but as a black player
      @opponent_games = Game.where("(white_player_id = #{current_user.id} OR black_player_id = #{current_user.id}) AND player_id != #{current_user.id}")
    end
end
