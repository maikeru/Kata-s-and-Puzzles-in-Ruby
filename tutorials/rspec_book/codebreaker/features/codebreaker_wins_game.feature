Feature: code-breaker wins game

    As a code-breaker
    I want to be told I won the game
    So that I don't have to keep guessing

    Scenario: win game
        Given the secret code is "1234"
        When I guess "1234"
        Then I should see "Congratulations! You won!"
