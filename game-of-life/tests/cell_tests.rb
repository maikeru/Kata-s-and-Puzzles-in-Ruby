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
end
