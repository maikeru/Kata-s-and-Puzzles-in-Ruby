Feature: player starts game
    As a chess player
    I want to start a game
    So that I can check my mate
    Scenario: start game
        Given I am not yet playing
        When I start a new game
        Then I should see a chess board
        And I should see "White's turn"
        And I should see "Select piece to move (e.g. a1):"
