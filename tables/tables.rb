#!/usr/bin/ruby

class Table
  attr_accessor :title, :contents, :width

  def initialize(title, contents)
    @title = title
    @contents = contents
    @width = longest_word + 2
  end

  def longest_word
    longest = title.length
    for word in @contents do
      if word.length > longest then longest = word.length end
    end
    longest
  end

  def print_table
    print_header
    print_contents
  end

  def print_horiz_bar
    print "+"
    @width.times do print "-" end
    puts "+"
  end

  def print_header
    print_horiz_bar
    print "| " + @title
    buffer = @width - (@title.length + 1)
    buffer.times do print " " end
    puts "|"
    print_horiz_bar
  end

  def print_contents
    for word in @contents do
      print "| " + word #+ " |"
      buffer = @width - (word.length + 1)
      buffer.times do print " " end
      puts "|"
    end
    print_horiz_bar
  end
end

puts "Enter some words, separated by spaces: ";

words = gets.chomp;
words2 = words.split;

puts "Enter a title: ";
title = gets.chomp;

table = Table.new(title, words2)
table.print_table()

puts "Your words " + words;
