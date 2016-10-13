module PiecesHelper

  def piece_symbol(piece)
    if piece.nil?
       "&#32;".html_safe
    else
      # puts "found results it is #{piece_result[0].image}"
       piece.image.html_safe   #image method on piece object
    end
  end
end
