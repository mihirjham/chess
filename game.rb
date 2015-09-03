require_relative "board"
require_relative "player"

class Game
  def initialize(board, players)
    @board = board
    @players = players
  end

  def run
    until @board.in_checkmate?(@players.first.color)
      @players.first.make_move
      @board.make_move(@players.first.start_pos, @players.first.end_pos)
      @players.first.move_refresh
      switch_players!
    end
  end

  def switch_players!
    @players.rotate!
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate

  white = Player.new(:white, board)
  black = Player.new(:black, board)
  game = Game.new(board, [white,black])
  game.run
end
