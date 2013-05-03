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
    @start_date = Date.new year, month, 1
    empty_dates = (1..first_week_empty_days).map { EmptyDate.new }
    non_empty_dates = (FIRST_DAY_OF_MONTH .. last_day_of_month).map do |day_of_month|
      PlainDate.new(Date.new year, month, day_of_month)
    end
    @month_dates = (empty_dates + non_empty_dates).flatten
  end

  def to_s
    plain =
      indent(title) + LINE_SEPARATOR +
      indent(header) + LINE_SEPARATOR +
      body
  end

  private

  def title
    @start_date.strftime("%B %Y").center CALENDAR_WIDTH
  end

  def header
    "Su Mo Tu We Th Fr Sa"
  end

  def body
    body_text = ""
    @month_dates.each do |date|
      body_text += date.format
      body_text += LINE_SEPARATOR if end_of_week? date.mday
    end
    body_text
  end

  def indent text
    " " * CALENDAR_INDENT + text
  end

  def first_week_empty_days
    @start_date.cwday
  end

  def end_of_week? day_of_month
    (first_week_empty_days + day_of_month) % DAYS_IN_A_WEEK == 0
  end

  def last_day_of_month
    (@start_date.next_month - 1).mday
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
