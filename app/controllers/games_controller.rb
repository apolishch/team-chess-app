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


  def piece_at(x,y)
    self.pieces.where(pieces.x_position && pieces.y_position !=nil)
     if pieces.x_position && pieces.y_position !=nil
       render @game.piece.image.htmlsafe
     else
       return ""
     end
  end

  private

  def game_params
    params.require(:game).permit(:game_title, :white_player_id)
  end
end
