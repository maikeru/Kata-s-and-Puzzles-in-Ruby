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

TODO: Write some cucumber features for BDD
What features would we have?
* player starts game
* player makes a move
* player checks opponent
* player checkmates opponent
* opponent checkmates player
* player draws game
* player quits game

I get the feeling that these will need breaking up but I'll stick with them as is for now.


K = King
Q = Queen
B = Bishop
N = Knight
R = Rook
P = Pawn
