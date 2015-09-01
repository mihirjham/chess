require_relative "piece"
require_relative "steppable"

class King < Piece
  include Steppable
  def initialize(position, color, board)
    super(position,color,board)
  end

  def move_dirs
    step_dirs
  end

  def to_s
    if(@color == :white)
      return " ♔ "
    else
      return " ♚ "
    end
  end
end
