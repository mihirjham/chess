require_relative "board"
require_relative "cursorable"

class Display
  include Cursorable
  attr_reader :board

  def initialize(board)
    @board = board
    @current_pos = [0,0]
  end

  def render
    system("clear")
    @board.grid.each {|row| puts row.join}
  end
end
