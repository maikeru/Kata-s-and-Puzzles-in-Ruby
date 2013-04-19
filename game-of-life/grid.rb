require_relative 'cell'

class Grid
  attr_reader :cells
  def initialize grid_string
    @cells = []
    grid_lines = grid_string.split "\n"
    x = grid_lines[0].length
    y = grid_lines.size
    (x * y).times { @cells.push Cell.new }
  end
end
