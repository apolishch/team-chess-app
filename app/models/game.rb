class Game < ActiveRecord::Base
  belongs_to :player
  has_many :pieces
  validates :game_title, presence: true
  validates :game_title, uniqueness: true

  # Game initialization
  after_create :initialize_board
  def initialize_board
    # White Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: 'white',
        is_captured: false
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: 'white', is_captured: false)
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: 'white', is_captured: false)

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: 'white', is_captured: false)
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: 'white', is_captured: false)

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: 'white', is_captured: false)
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: 'white', is_captured: false)

    Queen.create(game_id: id, x_position: 3, y_position: 7, color: 'white', is_captured: false)
    King.create(game_id: id, x_position: 4, y_position: 7, color: 'white', is_captured: false)

    # Black Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 1,
        color: 'black',
        is_captured: false
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: 'black', is_captured: false)
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: 'black', is_captured: false)

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: 'black', is_captured: false)
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: 'black', is_captured: false)

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: 'black', is_captured: false)
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: 'black', is_captured: false)

    Queen.create(game_id: id, x_position: 3, y_position: 0, color: 'black', is_captured: false)
    King.create(game_id: id, x_position: 4, y_position: 0, color: 'black', is_captured: false)
  end

  def is_game_in_check?(opponents_color)
    opponents_pieces = Piece.where(color: opponents_color).where(game_id: id).where.not(is_captured: true).all
    king = Piece.where(type: 'King').where(game_id: id).where.not(color: opponents_color).first
    in_check = false

    opponents_pieces.each do |opponents_piece|
      if opponents_piece.type == 'Pawn'
        in_check = opponents_piece.valid_pawn_capture?(king.x_position, king.y_position)
      else
        in_check = opponents_piece.valid_move?(king.x_position, king.y_position)
      end

      break if in_check
    end

    in_check
  end
end
