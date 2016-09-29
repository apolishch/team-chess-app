class DashboardsController < ApplicationController

    def show
      @games = Game.all
      @current_player_games = current_player_games
      # @opponent_games = opponent_games
    end

    def current_player_games
      current_player = find_current_player
      @current_player_games = current_player.games.limit(10)
      # Game.where("(white_player_id = #{current_player.id} OR black_player_id = #{current_player.id})
    end


    #open games TBD
    #games player white player id or black player id is nil which would be a an open game
end
