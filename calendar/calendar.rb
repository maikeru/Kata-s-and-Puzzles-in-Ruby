require 'date'

class Calendar
  def initialize year, month
    @date = Date.new year, month, 1
  end

  def to_s
    generate_plain
  end

  private

  CALENDAR_WIDTH = 20
  CALENDAR_INDENT = 1
  LINE_SEPARATOR = "\n"

  def generate_plain
    plain =
      " " + title + LINE_SEPARATOR +
      header + LINE_SEPARATOR +
      body
  end

  def title
    title = @date.strftime("%B %Y")
    title.center CALENDAR_WIDTH
  end

  def header
    " Su Mo Tu We Th Fr Sa"
  end

  def body
    end_of_month_date = @date.next_month - 1
    last_day_of_month = end_of_month_date.mday

    body_text = ""
    padding_size = first_week_empty_days
    (3 * padding_size).times { body_text += " " }
    (1 .. last_day_of_month).each do |day_of_month|
      body_text += format "%3d", day_of_month
      if end_of_week day_of_month
        body_text += LINE_SEPARATOR
      end
    end
    body_text
  end

  def first_week_empty_days
    @date.cwday
  end

  def end_of_week day_of_month
    (first_week_empty_days + day_of_month) % 7 == 0
  end
end
