#!/usr/bin/env ruby

# 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# 2. Any live cell with more than three live neighbours dies, as if by overcrowding.
# 3. Any live cell with two or three live neighbours lives on to the next generation.
# 4. Any dead cell with exactly three live neighbours becomes a live cell.

class Game
  start_grid = <<-ENDGRID
........
..****..
...**...
........
ENDGRID

  puts start_grid
  grid = Grid.new start_grid

end
