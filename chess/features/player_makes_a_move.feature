Feature: player makes a move

    As a chess player
    I want to make a move
    So that I can check my mate

    Scenario: select piece to move
        Given I have not made any moves
        And My opponent has not made any moves
        When I select piece at "a2"
        Then I should see "Select destination for piece at a2:"

    Scenario: select destination to move piece to
        Given I have selected a piece at "a2"
        When I select a destination of "a4"
        Then I should see a board with "a2" empty and a pawn in "a4"
