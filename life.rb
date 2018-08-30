class Life
  attr_reader :grid

  def initialize
    @grid = []
    10.times do |i|
      @grid[i] = []
      10.times do |j|
        @grid[i][j] = [0, 1].sample
      end
    end
  end

  def start_game
    new_grid = []
    @grid.each_with_index do |row, i|
      new_grid[i] = []
      row.each_with_index do |column, j|
        # make edges dead
        if i == 0 || i == 9 || j == 0 || j == 9
          new_grid[i][j] = 0
        # apply rules here
        else
          sum = sum_of_neighbors(@grid, i, j)
          if sum == 2 || sum == 3
            new_grid[i][j] = 1
          else
            new_grid[i][j] = 0
          end
        end
      end
    end

    self.display_grid(new_grid)
  end



  def sum_of_neighbors(grid, current_row_index, current_col_index)
    sum = 0
    for row_index in -1..1
      for col_index in -1..1
        # get the sum but do not count the current cell
        sum+= grid[current_row_index + row_index][current_col_index + col_index] unless (row_index == 0 && col_index == 0)
      end
    end
    return sum
  end



  def display_grid(grid)
    grid.each do |row|
      row.each do |cell|
        print "\u25A0" if cell == 1
        print "\u25A1" if cell == 0
      end
      print "\n"
    end
    puts "--------------------------------"
    # sleep 1
    # system "clear" or system "cls"
  end




end

game = Life.new
game.display_grid(game.grid)
game.start_game



