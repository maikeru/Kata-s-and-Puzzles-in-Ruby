require 'colorize'
require_relative 'plain_formatter'

class ColorFormatter < PlainFormatter
  def initialize calendar
    super
    @dateClass = ColorDate
  end

  private

  def title
    super.red
  end

  def header
    HEADER.black
  end
end

class ColorDate < PlainDate
  def format
    if @date.mday % 2 == 0
      super.red
    else
      super.black
    end
  end
end
