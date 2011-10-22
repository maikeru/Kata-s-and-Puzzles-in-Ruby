#!/usr/bin/ruby

class Table
  attr_accessor :title, :contents, :column_width, :longest_word

  def initialize(title, contents)
    @title = title
    @contents = contents
    @longest_word = longest_word
    @column_width = @longest_word + 2
  end

  def longest_word
    longest = title.length
    for word in @contents do
      if word.length > longest then longest = word.length end
    end
    longest
  end

  def left_align(text)
    padding = @longest_word - text.length
    padding.times do text += " " end
    return text
  end

  def center_align(text)
    left_padding = (@longest_word - text.length) / 2
    right_padding = left_padding
    # If we have an odd numbered width add the extra padding on the right
    if (right_padding % 2) != 0 then right_padding += 1 end
    aligned_text = ""
    left_padding.times do aligned_text += " " end
    aligned_text += text
    right_padding.times do aligned_text += " " end
    return aligned_text
  end

  def print_table
    print_header
    print_contents
  end

  def print_horiz_bar
    print "+"
    @column_width.times do print "-" end
    puts "+"
  end

  def print_header
    print_horiz_bar
    print "| " + center_align(@title)
    puts " |"
    print_horiz_bar
  end

  def print_contents
    for word in @contents do
      print "| " + left_align(word)
      puts " |"
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
