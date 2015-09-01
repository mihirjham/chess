class Piece
  #Don't need a value, as value is the class name itself
  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
  end

  def to_s
    #There will be a class specific to_s
    #raise here
  end


  #Will need this
  def dup(new_board)
    self.class.new(@position.dup, @color, new_board)
  end

  def empty?
    false
  end
end


class EmptyPiece < Piece
  def initialize(position, board)
    super(position, :blank, board)
  end

  def to_s
    "   "
  end

  def empty?
    true
  end

  def possible_moves
    []
  end

end
