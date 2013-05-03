class PlainFormatter
  CALENDAR_WIDTH = 20
  HEADER = "Su Mo Tu We Th Fr Sa"
  LINE_SEPARATOR = "\n"
  CALENDAR_INDENT = 1

  def initialize calendar
    @calendar = calendar
    @dateClass = PlainDate
  end

  def format
    temp_dates = @calendar.month_dates.map { |date| @dateClass.new date }
    empty_dates = (1..@calendar.first_week_empty_days).map { EmptyDate.new }
    @formatted_dates = (empty_dates + temp_dates).flatten
    plain =
      indent(title) + LINE_SEPARATOR +
      indent(header) + LINE_SEPARATOR +
      body
  end

  private

  def title
    @calendar.start_date.strftime("%B %Y").center CALENDAR_WIDTH
  end

  def header
    HEADER
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
