require 'minitest/autorun'
require_relative '../calendar'

describe Calendar do
  it "#generate" do
    year = 2013
    month = 5
    calendar = Calendar.new year, month
    expected =
"       May 2013\n" +
" Su Mo Tu We Th Fr Sa\n" +
"           1  2  3  4\n" +
"  5  6  7  8  9 10 11\n" +
" 12 13 14 15 16 17 18\n" +
" 19 20 21 22 23 24 25\n" +
" 26 27 28 29 30 31"
    calendar.to_s.must_equal expected
  end
end
