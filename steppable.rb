module Steppable
  L_STEP_DIRS = [
  [-2,1],
  [-2,-1],
  [2,-1],
  [2,1],
  [-1,-2],
  [-1,2],
  [1,2],
  [1,-2]
]
  STEP_DIRS = [
    [0,1],
    [0,-1],
    [1,0],
    [-1,0],
    [1,1],
    [-1,-1],
    [1,-1],
    [-1,1]
  ]

  def l_step_dirs
    L_STEP_DIRS
  end

  def step_dirs
    STEP_DIRS
  end

  def possible_moves
    moves = []
    start_row, start_col = @position[0], @position[1]
    move_dirs.each do |dir|
      row_dir,col_dir = dir[0], dir[1]
      new_row = start_row + row_dir
      new_col = start_col + col_dir

      # loop until done sliding

      if @board.in_bounds?([new_row, new_col])
        if @board.empty?([new_row, new_col])
          moves << [new_row, new_col]
        #  new_row, new_col = new_row + dir[0], new_col + dir[1]
        else
          if @board.grid[new_row][new_col].color != @color
            moves << [new_row, new_col]
          end
        end
      end
    end
    moves
  end
end
