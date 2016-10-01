class PiecesController < ApplicationController


  def show
    @piece = Piece.new
  end

  private

  def piece_params
    @piece_params = params.require(:piece).permit(
      :x_position,
      :y_position,
      :type,
      :image)
  end


end
