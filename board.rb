require_relative "reload"

class Board
  attr_reader :grid

  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
  end

  def populate
    #White pawns
    (0..7).each do |col|
      @grid[6][col] = Pawn.new([6,col], :white, self)
    end

    #Black pawns
    (0..7).each do |col|
      @grid[1][col] = Pawn.new([1,col], :black, self)
    end

    (0..7).each do |col|
      if(col == 0 || col == 7)
        @grid[0][col] = Rook.new([0,col], :black, self)
        @grid[7][col] = Rook.new([7,col], :white, self)
      elsif(col == 1 || col == 6)
        @grid[0][col] = Knight.new([0,col], :black, self)
        @grid[7][col] = Knight.new([7,col], :white, self)
      elsif(col == 2 || col == 5)
        @grid[0][col] = Bishop.new([0,col], :black, self)
        @grid[7][col] = Bishop.new([7,col], :white, self)
      elsif(col == 3)
        @grid[0][col] = Queen.new([0,col], :black, self)
        @grid[7][col] = Queen.new([7,col], :white, self)
      elsif(col == 4)
        @grid[0][col] = King.new([0,col], :black, self)
        @grid[7][col] = King.new([7,col], :white, self)
      end
    end

    (0..7).each do |row|
      (0..7).each do |col|
        if(@grid[row][col].nil?)
          @grid[row][col] = EmptyPiece.new([row,col], self)
        end
      end
    end

  end

  def in_bounds?(pos)
    pos.all? {|x| x.between?(0,7)}
  end

  # Duck type (quack)
  def win?
    (0..7).each do |row|
      (0..7).each do |col|
        return false if @grid[row][col].empty?
      end
    end

    true
  end

  def make_move(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[1]]
    end_piece = @grid[end_pos[0]][end_pos[1]]

    if start_piece.valid_moves.include?(end_piece.position)
      start_piece.update_pos(end_pos)
      @grid[end_pos[0]][end_pos[1]] = start_piece
      @grid[start_pos[0]][start_pos[1]] = EmptyPiece.new(start_pos, self)
    end
  end

  def make_move!(start_pos, end_pos)
    start_piece = @grid[start_pos[0]][start_pos[1]]
    end_piece = @grid[end_pos[0]][end_pos[1]]

    start_piece.update_pos(end_pos)
    @grid[end_pos[0]][end_pos[1]] = start_piece
    @grid[start_pos[0]][start_pos[1]] = EmptyPiece.new(start_pos, self)
  end

  def in_check?(color)
    king_position = find_king(color)
    color == :black ? (other_color = :white) : (other_color = :black)
    (0..7).each do |row|
      (0..7).each do |col|
        if @grid[row][col].color == other_color
          @grid[row][col].possible_moves.each do |position|
            if position == king_position
              return true
            end
          end
        end
      end
    end
    false
  end

  def in_checkmate?(color)
    # king_postion = find_king(color)
    if self.in_check?(color)
      (0..7).each do |row|
        (0..7).each do |col|
          if(@grid[row][col].color == color)
            return false if !@grid[row][col].valid_moves.empty?
          end
        end
      end
      return true
    end
    false
  end

  def dup
    new_board = Board.new
    (0..7).each do |row|
      (0..7).each do |col|
        new_board.grid[row][col] = @grid[row][col].dup(new_board)
      end
    end
    new_board
  end

  def find_king(color)
    (0..7).each do |row|
      (0..7).each do |col|
        if(@grid[row][col].is_king? && @grid[row][col].color == color)
          return [row,col]
        end
      end
    end
  end

  # Duck type (quack)
  def empty?(position)
    @grid[position[0]][position[1]].empty?
  end
end
