require 'minitest/autorun'
require_relative '../grid'

describe 'when a 4x4 grid string is passed to the grid' do
  it 'generates a grid with 16 cells' do
    grid_string = <<-ENDGRID
....
....
....
....
    ENDGRID
    grid = Grid.new grid_string
    grid.cells.count.must_equal 16
  end
end
