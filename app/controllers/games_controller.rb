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

  # def piece_at(x,y)
  #   self.pieces.where(pieces.x_position && pieces.y_position !=nil)
  #   # if not equal to nil use html unicode representation
  #   if pieces.x_position && pieces.y_position !=nil
  #     render @game.piece.image.htmlsafe
  #   else
  #     return ""
  #   end
  # end



  # def self.pieces(x_position, y_position)
  #   where("x_position = '#{x_position}' AND y_position = '#{y_position}'").present?
  # end

  # piece_at = pieces.find { |piece| piece.x_position == i && piece.y_position == j }
  # Pieces.where("x_position = ? AND y_position = ?", params[:orders], true )
                                                     #what is the params for, change boolean to not nil?


    #[ schema. ] object [ .part ] [ @ dblink ] pattern   sql
  # end

  private

  def game_params
    params.require(:game).permit(:game_title, :white_player_id)
  end
end
