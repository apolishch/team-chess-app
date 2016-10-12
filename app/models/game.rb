class Game < ActiveRecord::Base


    belongs_to :player
    has_many :pieces

 # Game initialization
  after_create :initialize_board

  def return_piece(x,y)
     piece_result = Piece.where(game_id: id, x_position: x, y_position: y)
     if piece_result.empty?
       "&#32;".html_safe
     else
      # puts "found results it is #{piece_result[0].image}"
       piece_result[0].image.html_safe
     end
  end


  def initialize_board
    # White Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 1,
        color: 'white',
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: 'white', image: '	&#9814;')
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: 'white', image: '	&#9814;')

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: 'white', image: '&#9816;')
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: 'white', image: '&#9816;')

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: 'white', image:'&#9815;')
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: 'white', image:'&#9815;')

    Queen.create(game_id: id, x_position: 3, y_position: 0, color: 'white', image: '&#9813;')
    King.create(game_id: id, x_position: 4, y_position: 0, color: 'white', image:'&#9812;')
    binding.pry

    # Black Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: 'black',
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: 'black')
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: 'black')

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: 'black')
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: 'black')

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: 'black')
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: 'black')

    Queen.create(game_id: id, x_position: 3, y_position: 7, color: 'black')
    King.create(game_id: id, x_position: 4, y_position: 7, color: 'black')
  end
end
