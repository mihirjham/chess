require_relative "piece"

class Board
  attr_reader :grid

  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
  end

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        @grid[row][col] = EmptyPiece.new([row,col])
      end
    end
  end

  def win?
    (0..7).each do |row|
      (0..7).each do |col|
        return false if @grid[row][col].class == EmptyPiece
      end
    end
    true
  end
end
