class DashboardsController < ApplicationController

    def show
      @games = Game.all
      @current_player_games = current_player_games
      @opponent_games = opponent_games
    end

    def current_player_games
      current_player = find_current_player
      @current_player_games = current_player.games.limit(10)
    end

    def opponent_games
      # is partcipating but as a black player
      current_player = find_current_player
      @opponent_games = Game.where("(white_player_id = #{current_player.id} OR black_player_id = #{current_player.id}) AND player_id != #{current_player.id}")
    end

    def find_current_player
      return Player.find(current_user.id)
    end
end
