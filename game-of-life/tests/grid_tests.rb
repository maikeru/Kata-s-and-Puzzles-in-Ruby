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

  it 'generates an 8 x 4 grid' do
    grid.cells.size.must_equal 8
    grid.cells[0].size.must_equal 4
  end

  it 'puts the cell at (0,0) next to the one at (0,1)' do
    cell0_0 = grid.cells[0][0]
    cell0_1 = grid.cells[0][1]
    cell0_0.neighbours.must_include cell0_1
    cell0_1.neighbours.must_include cell0_0
  end

  it 'puts the cell at (0,0) next to the one at (1,0)' do
    cell0_0 = grid.cells[0][0]
    cell1_0 = grid.cells[1][0]
    cell0_0.neighbours.must_include cell1_0
    cell1_0.neighbours.must_include cell0_0
  end

  it 'puts the cell at (0,0) next to the one at (1,1)' do
    cell0_0 = grid.cells[0][0]
    cell1_1 = grid.cells[1][1]
    cell0_0.neighbours.must_include cell1_1
    cell1_1.neighbours.must_include cell0_0
  end

  it "doesn't put the cell at (0,0) next to the one at (3,3)" do
    cell0_0 = grid.cells[0][0]
    cell3_3 = grid.cells[3][3]
    cell0_0.neighbours.wont_include cell3_3
    cell3_3.neighbours.wont_include cell0_0
  end

  it "sets three neighbours for the cell at (0,0)" do
    cell0_0 = grid.cells[0][0]
    cell0_0.neighbours.count.must_equal 3
  end
end
