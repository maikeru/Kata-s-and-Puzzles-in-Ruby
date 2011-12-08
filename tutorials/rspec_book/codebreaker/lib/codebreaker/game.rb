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
            if marker.exact_match_count == 4
                @output.puts 'Congratulations! You won!'
                return
            end
        end
    end
end
