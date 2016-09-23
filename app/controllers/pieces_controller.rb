class PiecesController < ApplicationController




  def show
    @pieces = Pieces.new(pieces_params)
  end



  private

  def pieces_params
    @piece_params = params.require(:piece).permit(
      :x_position,
      :y_position,
      :type)
  end


end
