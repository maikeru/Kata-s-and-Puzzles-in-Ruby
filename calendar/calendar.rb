require 'date'

# Generates a calendar for the year and month passed in
class Calendar
  CALENDAR_WIDTH = 20
  CALENDAR_INDENT = 1
  LINE_SEPARATOR = "\n"
  SIZE_OF_DAY = 3
  FIRST_DAY_OF_MONTH = 1
  DAYS_IN_A_WEEK = 7

  def initialize year, month
    @date = Date.new year, month, 1
  end

  def to_s
    generate_plain
  end

  private

  def generate_plain
    plain =
      indent(title) + LINE_SEPARATOR +
      indent(header) + LINE_SEPARATOR +
      body
  end

  def title
    title = @date.strftime("%B %Y")
    title.center CALENDAR_WIDTH
  end

  def header
    "Su Mo Tu We Th Fr Sa"
  end

  def body
    body_text = " " * SIZE_OF_DAY * first_week_empty_days
    (FIRST_DAY_OF_MONTH .. last_day_of_month).each do |day_of_month|
      body_text += format "%3d", day_of_month
      body_text += LINE_SEPARATOR if end_of_week? day_of_month
    end
    body_text
  end

  def indent text
    " " * CALENDAR_INDENT + text
  end

  def first_week_empty_days
    @date.cwday
  end

  def end_of_week? day_of_month
    (first_week_empty_days + day_of_month) % DAYS_IN_A_WEEK == 0
  end

  def last_day_of_month
    (@date.next_month - 1).mday
  end
end

# A class for formatting calendars in a "plain" style
class PlainFormatter
end
