#require_relative "board"
#require_relative "cursorable"
require 'colorize'
require_relative 'reload'

class Display
  include Cursorable
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @possible_moves = []
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i,j] == @cursor_pos
      bg = :light_red
    elsif @possible_moves.include?([i,j])
      bg = :yellow
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    {background: bg, color: :white}
  end

  def render
    system("clear")
    build_grid.each {|row| puts row.join}
    p "White checkmate? : #{@board.in_checkmate?(:white)}"
    p "Black checkmate? : #{@board.in_checkmate?(:black)}";
  end
end
