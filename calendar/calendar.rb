require 'date'

# Generates a calendar for the year and month passed in
class Calendar
  attr_reader :start_date, :month_dates
  FIRST_DAY_OF_MONTH = 1
  DAYS_IN_A_WEEK = 7

  def initialize year, month, formatter
    @start_date = Date.new year, month, 1
    @formatter = formatter.new self
    empty_dates = (1..first_week_empty_days).map { EmptyDate.new }
    non_empty_dates = (FIRST_DAY_OF_MONTH .. last_day_of_month).map do |day_of_month|
      PlainDate.new(Date.new year, month, day_of_month)
    end
    @month_dates = (empty_dates + non_empty_dates).flatten
  end

  def to_s
    @formatter.format
  end

  def end_of_week? day_of_month
    (first_week_empty_days + day_of_month) % DAYS_IN_A_WEEK == 0
  end

  private

  def first_week_empty_days
    @start_date.cwday
  end

  def last_day_of_month
    (@start_date.next_month - 1).mday
  end
end

class PlainFormatter
  CALENDAR_WIDTH = 20
  HEADER = "Su Mo Tu We Th Fr Sa"
  LINE_SEPARATOR = "\n"
  CALENDAR_INDENT = 1

  def initialize calendar
    @calendar = calendar
  end

  def format
    plain =
      indent(title) + LINE_SEPARATOR +
      indent(header) + LINE_SEPARATOR +
      body
  end

  def title
    @calendar.start_date.strftime("%B %Y").center CALENDAR_WIDTH
  end

  def header
    HEADER
  end

  def body
    body_text = ""
    @calendar.month_dates.each do |date|
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

class PlainDate
  def initialize date
    @date = date
  end

  def format
    sprintf "%3d", @date.mday
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
