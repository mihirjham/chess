module Pawnable

  def possible_moves
    moves = []
    start_row, start_col = @position[0], @position[1]

    #Diagonal checking
    pos_dirs = [[1,1],[1,-1]]
    pos_dirs.each do |dir|
      if(@color == :white)
        dir[0] = -dir[0]
      end
      new_row, new_col = start_row + dir[0], start_col + dir[1]

      if(@board.in_bounds?([new_row,new_col]))
        if(!@board.empty?([new_row, new_col]) && @board.grid[new_row][new_col].color != @color)
          moves << [new_row, new_col]
        end
      end
    end

    #Forward checking
    pos_dirs = [[1,0]]
    if(@first)
      pos_dirs << [2,0]
    end

    pos_dirs.each do |dir|
      if(@color == :white)
        dir[0] = -dir[0]
      end
      new_row, new_col = start_row + dir[0], start_col + dir[1]
      if(@board.in_bounds?([new_row, new_col]))
        if(@board.empty?([new_row, new_col]))
          moves << [new_row, new_col]
        end
      end
    end

    moves
  end

end
