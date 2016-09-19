class GamesController < ApplicationController
    
    def index
    end    
    
    def new 
       @game = Game.new
    end
    
    def create 
      @game = Game.create(game_params)
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
    
    private 
    
    def game_params
      params.require(:game).permit(:name)
    end
end
