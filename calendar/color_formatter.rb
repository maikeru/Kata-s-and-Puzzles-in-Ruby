require 'colorize'

class ColorFormatter
  CALENDAR_WIDTH = 20
  HEADER = "Su Mo Tu We Th Fr Sa"
  LINE_SEPARATOR = "\n"
  CALENDAR_INDENT = 1

  def initialize calendar
    @calendar = calendar
  end

  def format
    temp_dates = @calendar.month_dates.map { |date| ColorDate.new date }
    empty_dates = (1..@calendar.first_week_empty_days).map { EmptyDate.new }
    @formatted_dates = (empty_dates + temp_dates).flatten
    text =
      indent(title) + LINE_SEPARATOR +
      indent(header) + LINE_SEPARATOR +
      body
  end

  private

  def title
    title = @calendar.start_date.strftime("%B %Y").center CALENDAR_WIDTH
    title.red
  end

  def header
    HEADER.black
  end

  def body
    body_text = ""
    @formatted_dates.each do |date|
      body_text += date.format
      body_text += LINE_SEPARATOR if @calendar.end_of_week? date.mday
    end
    body_text
  end

  private

  def indent text
    " " * CALENDAR_INDENT + text
  end

end

class ColorDate
  def initialize date
    @date = date
  end

  def format
    day_text = sprintf "%3d", @date.mday
    if @date.mday % 2 == 0
      day_text.red
    else
      day_text.black
    end
  end

  def mday
    @date.mday
  end
end

class EmptyDate
  def format
    " " * 3
  end

  def mday
    0
  end
end
