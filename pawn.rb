require_relative "piece"
require_relative "pawnable"

class Pawn < Piece
  include Pawnable
  def initialize(position, color, board)
    super(position,color,board)
    @first = true
  end

  def to_s
    if(@color == :white)
      return " ♙ "
    else
      return " ♟ "
    end
  end
end
