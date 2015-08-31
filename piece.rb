class Piece

  def initialize(value, position, color)
    @value = value
    @position = position
    @color = color
  end

  def to_s
    if(@value == :empty)
      " "
    end
  end
end

class EmptyPiece < Piece
  def initialize(position)
    super(:empty, position, :blank)
  end
end
