
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
  end
end

