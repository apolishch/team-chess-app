class PiecesController < ApplicationController

  def update
    @piece = Piece.find(params[:id])
    if @piece.piece.valid_move?.update_attributes(params[:x_position],[:y_position])
      render json: piece
    else
      render text: 'Unauthorized', status: :unauthorized
    end
  end


end
