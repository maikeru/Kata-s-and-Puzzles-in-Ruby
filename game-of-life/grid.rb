require_relative 'cell'
require 'pp'

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
    @cells = Array.new(x) { Array.new(y) { Cell.new } }
    y.times do |y_pos|
      x.times do |x_pos|
        new_cell = @cells[x_pos][y_pos]
        if x_pos > 0
          previous_cell = @cells[x_pos - 1][y_pos]
          previous_cell.add_neighbour new_cell
        end
        if y_pos > 0
          above_cell = @cells[x_pos][y_pos - 1]
          above_cell.add_neighbour new_cell
        end
        if x_pos > 0 and y_pos > 0
          above_left_cell = @cells[x_pos - 1][y_pos - 1]
          above_left_cell.add_neighbour new_cell
        end
        if x_pos < (x - 1) and y_pos > 0
          above_right_cell = @cells[x_pos + 1][y_pos - 1]
          above_right_cell.add_neighbour new_cell
        end
      end
    end

    #puts "#{@cells[2][1].to_s} #{@cells[3][1]} #{@cells[4][1]}"
    #puts "#{@cells[2][2].to_s} #{@cells[3][2]} #{@cells[4][2]}"
    #puts "#{@cells[2][3].to_s} #{@cells[3][3]} #{@cells[4][3]}"
    #pp self
  end
end
