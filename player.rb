require_relative "display"

class Player
  attr_reader :color
  attr_accessor :start_pos, :end_pos
  def initialize(color, board)
    @color = color
    @display =  Display.new(board)
    @board = board
    @start_pos = nil
    @end_pos = nil
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end

  def make_move
    while start_pos.nil?
      result = move
      if(correct_color?(result))
        @start_pos = result
      end
    end

    while end_pos.nil?
      result = move
      if @board.grid[start_pos[0]][start_pos[1]].valid_moves.include?(result)
        @end_pos = result
      end
    end
  end

  def move_refresh
    @start_pos = nil
    @end_pos = nil
  end

  def correct_color?(pos)
    @board.grid[pos[0]][pos[1]].color == color
  end

end
