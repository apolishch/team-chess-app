class PiecesController < ApplicationController

  def update
    @piece = Piece.find(params[:id])
    if @piece.valid_move?(params[:x_position],[:y_position]).update_attributes(x_position: 5, y_position: 1)
      render json: piece
    else
      render text: 'Unauthorized', status: :unauthorized
    end
  end
end

