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
    @selected_pos = []
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
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    {background: bg, color: :white}
  end

  def render
    system("clear")
    grid_colored = build_grid.each {|row| puts row.join}
    p @cursor_pos
    p @selected_pos
    if(@selected_pos != [])
      @board.grid[@selected_pos[0]][@selected_pos[1]].possible_moves.each do |move|
        grid_colored[move[0]][move[1]] = @board.grid[move[0]][move[1]].to_s.colorize({bg: :white, color: :white})
      end
    end
    grid_colored
  end
end
