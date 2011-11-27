#!/usr/bin/env ruby
#
# Two Player Chess Engine

class Board
    def initialize

    end

    def display
        puts "Displaying chess board..."
    end
end

class Game
    attr_accessor :game_over, :board

    def initialize
        @game_over = false
        @board = Board.new()
    end

    def start
        # While exit condition not met
        until game_over
            # Display the board
            @board.display
            @game_over = true
            # Request next player's move
            # Parse move
            # Check if move valid
            # Make move
            # Check win/lose conditions
            # end while
        end
    end
end

game = Game.new
game.start
