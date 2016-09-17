# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  dummy_bishop = Piece.create(type: 'Bishop', color: 'black', image: '', x_position: 2, y_position: 0, is_captured: false, game_id: 0)

  dummy_rook = Piece.create(type: 'Rook', color: 'black', image: '', x_position: 0, y_position: 0, is_captured: false, game_id: 0)

  dummy_queen = Piece.create(type: 'Queen', color: 'black', image: '', x_position: 3, y_position: 0, is_captured: false, game_id: 0)

  dummy_king = Piece.create(type: 'King', color: 'black', image: '', x_position: 4, y_position: 0, is_captured: false, game_id: 0)

  dummy_pawn_black = Piece.create(type: 'Pawn', color: 'black', image: '', x_position: 1, y_position: 1, is_captured: false, game_id: 0)

  dummy_pawn_white = Piece.create(type: 'Pawn', color: 'white', image: '', x_position: 1, y_position: 6, is_captured: false, game_id: 0)

  dummy_knight = Piece.create(type: 'Knight', color: 'black', image: '', x_position: 1, y_position: 0, is_captured: false, game_id: 0)


