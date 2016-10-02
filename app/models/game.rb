class Game < ActiveRecord::Base


    belongs_to :player
    has_many :pieces

 # Game initialization
  after_create :initialize_board

  def return_piece(x,y)
     piece_result = Piece.where(game_id: id, x_position: x, y_position: y)
     if piece_result.empty?
       puts "did not find result "
       " ------"
     else
       puts "found results it is #{piece_result[0].image}"
       piece_result[0].image
     end
  end
    # self.pieces.find_by(pieces.x_position && pieces.y_position !=nil)
  # #  if not equal to nil use html unicode representation
  #   if pieces.x_position && pieces.y_position !=nil
  #       return piece.image.htmlsafe
  #   else
  #     return " "
  #   end



  def initialize_board
    # White Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 1,
        color: 'white',
        image: '&#9817;',
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

    # Black Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: 'black',
        image: '&#9823;',
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: 'black', image:'&#9820;')
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: 'black', image:'&#9820;')

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: 'black', image:'&#9822;')
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: 'black', image:'&#9822;')

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: 'black', image: '&#9821;')
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: 'black', image: '&#9821;')

    Queen.create(game_id: id, x_position: 3, y_position: 7, color: 'black', image:'&#9818;')
    King.create(game_id: id, x_position: 4, y_position: 7, color: 'black', image: '&#9818;')
  end
end
