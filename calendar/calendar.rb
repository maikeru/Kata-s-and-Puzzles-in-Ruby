require 'date'

# Generates a calendar for the year and month passed in
class Calendar
  attr_reader :start_date, :month_dates
  FIRST_DAY_OF_MONTH = 1
  DAYS_IN_A_WEEK = 7

  def initialize year, month, formatter
    @start_date = Date.new year, month, 1
    @formatter = formatter.new self
    @month_dates = (FIRST_DAY_OF_MONTH .. last_day_of_month).map do |day_of_month|
      Date.new year, month, day_of_month
    end
  end

  def to_s
    @formatter.format
  end

  def first_week_empty_days
    @start_date.cwday
  end

  def end_of_week? day_of_month
    (first_week_empty_days + day_of_month) % DAYS_IN_A_WEEK == 0
  end

  private

  def last_day_of_month
    (@start_date.next_month - 1).mday
  end
end
