require_relative "piece"
require_relative "steppable"

class Knight < Piece
  include Steppable
  def initialize(position, color, board)
    super(position,color,board)
  end

  def move_dirs
    l_step_dirs
  end

  def to_s
    if(@color == :white)
      return " ♘ "
    else
      return " ♞ "
    end
  end
end
