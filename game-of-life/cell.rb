
class Cell
  attr_accessor :state
  def is_dead?
    @state == "dead"
  end

  def is_alive?
    @state == "alive"
  end
end

