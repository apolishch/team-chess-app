class PiecesController < ApplicationController

  def update
    @piece = Piece.find(params[:id])
    #valid_move ? x , y
    # if @piece.valid_move?(params[:x_position],[:y_position])
       @piece.update_attributes(x_position: params[:x_position], y_position: params[:y_position])
      # render json: piece
    # else
      # render text: 'Unauthorized', status: :unauthorized
    # end
  end
end

