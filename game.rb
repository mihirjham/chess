require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @board.populate
    @player = Player.new(@board)
  end

  def run
    until @board.win?
      pos = @player.move
      @board.mark(pos)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.run
end
