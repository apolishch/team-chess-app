require 'rails_helper'

RSpec.describe Game, type: :model do
  subject! { Game.create }

  it 'creates 32 game pieces' do
    expect(subject.pieces.count).to eql 32
  end

  context 'Pawns' do
    it 'creates 8 black pawns' do
      expect(Pawn.where(color: 'black').count).to eql 8
    end

    it 'creates 8 white pawns' do
      expect(Pawn.where(color: 'white').count).to eql 8
    end
  end

  context 'Bishops' do
    it 'creates 2 black bishops' do
      expect(Bishop.where(color: 'black').count).to eql 2
    end

    it 'creates 2 white bishops' do
      expect(Bishop.where(color: 'white').count).to eql 2
    end
  end

  context 'Kings' do
    it 'creates 1 black king' do
      expect(King.where(color: 'black').count).to eql 1
    end

    it 'creates 1 white king' do
      expect(King.where(color: 'white').count).to eql 1
    end
  end

  context 'Knights' do
    it 'creates 2 black knights' do
      expect(Knight.where(color: 'black').count).to eql 2
    end

    it 'creates 2 white knights' do
      expect(Knight.where(color: 'white').count).to eql 2
    end
  end

  context 'Queens' do
    it 'creates 1 black queen' do
      expect(Queen.where(color: 'black').count).to eql 1
    end

    it 'creates 1 white queen' do
      expect(Queen.where(color: 'white').count).to eql 1
    end
  end

  context 'Rooks' do
    it 'creates 2 black rooks' do
      expect(Rook.where(color: 'black').count).to eql 2
    end

    it 'creates 2 white rooks' do
      expect(Rook.where(color: 'white').count).to eql 2
    end
  end
end
