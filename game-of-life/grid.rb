require_relative 'cell'

class Grid
  attr_reader :cells
  def initialize grid_string
    @cells = []
    generate_from grid_string
  end

  private

  def generate_from grid_string
    grid_lines = grid_string.split "\n"
    x = grid_lines[0].length
    y = grid_lines.size
    y.times do |y_pos|
      x.times do |x_pos|
        new_cell = Cell.new
        previous_cell = @cells.last
        @cells.push new_cell
        if previous_cell
          previous_cell.neighbours.push new_cell
          new_cell.neighbours.push previous_cell
        end
        if y_pos > 0
          above_cell_index = x_pos * (y_pos - 1)
          above_cell = @cells[above_cell_index]
          above_cell.neighbours.push new_cell
          new_cell.neighbours.push above_cell
        end
      end
    end
  end
end
