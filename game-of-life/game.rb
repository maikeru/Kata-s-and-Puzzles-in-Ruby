#!/usr/bin/env ruby

require 'minitest/autorun'

class Game
  def self.get_next_generation_from grid
    grid
  end
end

describe Game, "when given an empty grid" do
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

