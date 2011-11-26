Chess Variants(I)
=================

From [Chess Variants(I)](http://www.rubyquiz.com/quiz35.html) on Ruby Quiz.

My simple summary:
Create a two player chess engine with a simple interface. Include rule checking for illegal moves, check, checkmate and stalemate. The second part of this quiz involves adapting the code to deal with variants so need to make implementation flexible.

---
Plans/Brainstorming
-------------------

The way I see it this program divides into the following parts:

The basic sequence of events should be something like this:
* Display board
* Request move
* Check if can move
* Make move
* Check win/lose conditions

Breaking this up into responsibilities:
* Internal board representation
* External board representation (display)
* Player interface
* (move parsing)
* Rule checking (pre/post move)


K = King
Q = Queen
B = Bishop
N = Knight
R = Rook
P = Pawn
