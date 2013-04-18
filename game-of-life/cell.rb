require 'minitest/autorun'

class Cell
  attr_accessor :state
  def is_dead?
    @state == "dead"
  end

  def is_alive?
    @state == "alive"
  end
end

describe "when a cell is in a dead state" do
  it "says that it is dead" do
    cell = Cell.new
    cell.state = "dead"
    assert cell.is_dead?
  end

  it "says that it is not alive" do
    cell = Cell.new
    cell.state = "dead"
    assert !cell.is_alive?
  end
end

describe "when a cell is in an alive state" do
  it "says that is is alive" do
    cell = Cell.new
    cell.state = "alive"
    assert cell.is_alive?
  end

  it "says that is is not dead" do
    cell = Cell.new
    cell.state = "alive"
    assert !cell.is_dead?
  end
end

describe "when a cell is dead" do
  #before do
  #  @cell = Cell.new
  #  @cell.state = "dead"
  #end

  #describe "and it has no neighbours" do
  #  it "stays dead" do
  #    @cell.neighbours.add(Cell.new)
  #    @cell.neighbours.add(Cell.new)
  #    @cell.evaluate
  #    assert @cell.is_dead
  #  end
  #end

  describe "and it has one neighbour" do
    it "stays dead"
  end

  describe "and it has two neighbours" do
    it "stays dead"
  end

  describe "and it has three neighbours" do
    it "comes to life"
  end

  describe "and it has four neighbours" do
    it "stays dead"
  end
end

describe "when a cell is alive" do
  describe "and it has no neighbours" do
    it "dies"
  end

  describe "and it has one neighbour" do
    it "dies"
  end

  describe "and it has two neighbours" do
    it "lives"
  end

  describe "and it has three neighbours" do
    it "lives"
  end

  describe "and it has four neighbours" do
    it "dies"
  end
end
