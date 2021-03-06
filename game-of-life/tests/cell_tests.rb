require 'minitest/autorun'
require_relative '../cell'

describe "when a cell is in a dead state" do
  before do
    @cell = Cell.new
    @cell.die
  end

  it "says that it is dead" do
    assert @cell.is_dead?
  end

  it "says that it is not alive" do
    assert !@cell.is_alive?
  end
end

describe "when a cell is in an alive state" do
  before do
    @cell = Cell.new
    @cell.vivify
  end

  it "says that is is alive" do
    assert @cell.is_alive?
  end

  it "says that is is not dead" do
    assert !@cell.is_dead?
  end
end

describe "when a cell is dead" do

  before do
    @cell = Cell.new
    @cell.die
  end

  describe "and it has no neighbours" do
    it "stays dead" do
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has one neighbour" do
    it "stays dead" do
      @cell.neighbours.push Cell.new
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has two neighbours" do
    it "stays dead" do
      2.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has three neighbours" do
    it "comes to life" do
      3.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_alive?
    end
  end

  describe "and it has four neighbours" do
    it "stays dead" do
      4.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has six neighbours" do
    it "stays dead" do
      6.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_dead?
    end
  end
end

describe "when a cell is alive" do
  before do
    @cell = Cell.new
    @cell.vivify
  end

  describe "and it has no neighbours" do
    it "dies" do
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has one neighbour" do
    it "dies" do
      @cell.neighbours.push Cell.new
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has two neighbours" do
    it "lives" do
      2.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_alive?
    end
  end

  describe "and it has three neighbours" do
    it "lives" do
      3.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_alive?
    end
  end

  describe "and it has four neighbours" do
    it "dies" do
      4.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_dead?
    end
  end

  describe "and it has seven neighbours" do
    it "dies" do
      7.times { @cell.neighbours.push Cell.new }
      @cell.evaluate
      assert @cell.is_dead?
    end
  end
end

describe "when cell a is added as a neighbour to cell b" do
  before do
    @cell_a = Cell.new
    @cell_b = Cell.new
    @cell_b.add_neighbour @cell_a
  end

  it "exists in cell b's neighbour list" do
    @cell_b.neighbours.must_include @cell_a
  end
  it "contains cell b in it's neighbour list" do
    @cell_a.neighbours.must_include @cell_b
  end
end

describe "when cell a is added as a neighbour to cell b twice" do
  before do
    @cell_a = Cell.new
    @cell_b = Cell.new
    @cell_b.add_neighbour @cell_a
    @cell_b.add_neighbour @cell_a
  end

  it "only exists once in b's neighbour list" do
    @cell_b.neighbours.count(@cell_a).must_equal 1
  end
  it "only contains b once in it's neighbour list" do
    @cell_a.neighbours.count(@cell_b).must_equal 1
  end
end
