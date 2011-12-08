module Codebreaker
    class Game
        def initialize(output)
            @output = output
        end

        def start(secret)
            @secret = secret
            @output.puts 'Welcome to Codebreaker!'
            @output.puts 'Enter guess:'
        end

        def guess(guess)
            marker = Marker.new(@secret, guess)
            @output.puts '+' * marker.exact_match_count + 
                         '-' * marker.number_match_count
            if has_won?(marker)
                @output.puts 'Congratulations! You won!'
                return
            end
        end

        def has_won?(marker)
            marker.exact_match_count == 4
        end
    end
end
