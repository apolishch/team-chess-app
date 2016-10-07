class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    if current_user.player
      @game = Game.new
    else
      redirect_to new_player_path
    end
  end

  def create
    @game = find_current_player.games.create(game_params)
    if @game.valid?
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])

    return render_not_found if @game.blank?
  end

  def update
    @piece = Piece.find(params[:id])
    if @piece.piece.valid_move?.update_attributes(params[:x_position],[:y_position])
    else
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_title, :white_player_id)
  end
end
