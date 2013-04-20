
class Cell
  @@id_counter = 0
  attr_accessor :state, :neighbours
  attr_reader :id
  def initialize
    @neighbours = []
    @id = @@id_counter
    @@id_counter += 1
  end

  def is_dead?
    @state == "dead"
  end

  def is_alive?
    not is_dead?
  end

  def evaluate
    if @neighbours.count == 3
      vivify
    elsif @neighbours.count < 2 || @neighbours.count > 3
      die
    elsif @neighbours.count == 2
      #don't change state
    end
  end

  def die
    @state = "dead"
  end

  def vivify
    @state = "alive"
  end

  def add_neighbour neighbour
    @neighbours.push neighbour
    neighbour.neighbours.push self
  end

  def to_s
    "cell_#{id.to_s}"
  end

end

