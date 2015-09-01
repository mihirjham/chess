require_relative "piece"
require_relative "slidable"

class Bishop < Piece
  include Slidable
  def initialize(position, color, board)
    super(position,color,board)
  end

  def move_dirs
    diagonal_dirs
  end

  def to_s
    if(@color == :white)
      return " ♗ "
    else
      return " ♝ "
    end
  end
end
