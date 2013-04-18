
class Cell
  attr_accessor :state, :neighbours
  def initialize
    @neighbours = []
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

end

