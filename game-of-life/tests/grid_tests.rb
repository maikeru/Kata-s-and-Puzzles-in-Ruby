require 'minitest/autorun'
require_relative '../grid'

eight_by_four_empty_grid = <<-ENDGRID
........
........
........
........
    ENDGRID
describe 'when a 8x4 grid string is passed to the grid' do
  grid_string = eight_by_four_empty_grid

  let(:grid) { Grid.new grid_string }

  it 'generates a grid with 16 cells' do
    grid.cells.count.must_equal 32
  end

  it 'puts the cell at (0,0) next to the one at (0,1)' do
    cell0_0 = grid.cells[0]
    cell0_1 = grid.cells[1]
    cell0_0.neighbours.must_include cell0_1
    cell0_1.neighbours.must_include cell0_0
  end

  it 'puts the cell at (0,0) next to the one at (1,0)' do
    cell0_0 = grid.cells[0]
    cell1_0 = grid.cells[8]
    cell0_0.neighbours.must_include cell1_0
    cell1_0.neighbours.must_include cell0_0
  end
  it 'puts the cell at (0,0) next to the one at (1,1)'
end
