#!/usr/bin/env ruby

require 'minitest/autorun'

# 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# 2. Any live cell with more than three live neighbours dies, as if by overcrowding.
# 3. Any live cell with two or three live neighbours lives on to the next generation.
# 4. Any dead cell with exactly three live neighbours becomes a live cell.

class Game
  def self.get_next_generation_from grid
    live_cell_count = grid.count('*')
    if live_cell_count == 1
      grid.sub! '*', '.'
    elsif live_cell_count == 2
      grid
    else
      grid
    end
  end
end

describe "when given an empty grid" do
  it "should return the same grid" do
    input_grid = <<-ENDGRID
........
........
........
........
ENDGRID

    expected_grid = <<-ENDGRID
........
........
........
........
ENDGRID
    result_grid = Game.get_next_generation_from input_grid
    result_grid.must_equal expected_grid
  end
end

describe "when given a grid with only one cell" do
  it "should return an empty grid" do
    input_grid = <<-ENDGRID
........
....*...
........
........
ENDGRID

    expected_grid = <<-ENDGRID
........
........
........
........
ENDGRID
    result_grid = Game.get_next_generation_from input_grid
    result_grid.must_equal expected_grid
  end
end

describe "when given a grid with two neighbouring cells" do
  it "should return the same grid" do
    input_grid = <<-ENDGRID
........
...**...
........
........
ENDGRID

    expected_grid = <<-ENDGRID
........
...**...
........
........
ENDGRID
    result_grid = Game.get_next_generation_from input_grid
    result_grid.must_equal expected_grid
  end
end
