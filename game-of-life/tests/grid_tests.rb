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

  it "sets eight neighbours for the cell at (3,2)" do
    cell3_2 = grid.cells[3][2]
    cell3_2.neighbours.must_include grid.cells[2][1]
    cell3_2.neighbours.must_include grid.cells[3][1]
    cell3_2.neighbours.must_include grid.cells[4][1]
    cell3_2.neighbours.must_include grid.cells[2][2]
    cell3_2.neighbours.must_include grid.cells[4][2]
    cell3_2.neighbours.must_include grid.cells[2][3]
    cell3_2.neighbours.must_include grid.cells[3][3]
    cell3_2.neighbours.must_include grid.cells[4][3]
  end
end

describe 'when an empty 8x4 grid string is passed to the grid' do
  grid = Grid.new eight_by_four_empty_grid
  it 'sets all the cells as dead' do
    assert grid.cells.flatten.all? { |cell| cell.is_dead? }
  end

  describe 'and the next generation is calculated' do
    grid.calculate_generation
    it 'produces the same grid' do
      # TODO Grid needs to set each sell as alive or dead before we can do this test
      #grid.to_s.must_equal eight_by_four_empty_grid
    end
  end
end
