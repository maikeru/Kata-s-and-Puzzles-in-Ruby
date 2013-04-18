
class Cell
  attr_accessor :state, :neighbours
  def initialize
    @neighbours = []
  end

  def is_dead?
    @state == "dead"
  end

  def is_alive?
    @state == "alive"
  end

  def evaluate
    if @neighbours.count == 3
      @state = "alive"
    elsif @neighbours.count < 2 || @neighbours.count > 3
      @state = "dead"
    elsif @neighbours.count == 2
      #don't change state
    end
  end
end

