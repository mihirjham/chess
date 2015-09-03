class Piece
  #Don't need a value, as value is the class name itself
  attr_reader :color, :position
  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
  end

  def update_pos(pos)
    @position = pos
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

  def is_king?
    false
  end

  def valid_moves
    possible_moves.reject do |move|
      new_board = @board.dup
      new_board.make_move!(@position, move)
      new_board.in_check?(@color)
    end
  end
end


class EmptyPiece < Piece
  def initialize(position, color=:blank, board)
    super(position, color, board)
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
