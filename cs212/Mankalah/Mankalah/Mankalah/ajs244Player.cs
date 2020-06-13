using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace Mankalah
{
    /* ajs244Player is a Mankalah AI player that uses minimax search and alpha beta pruning to decide
     * what its next move should be, given a time bound of 4 seconds to make its decision.
     */
    class ajs244Player : Player
    {
        Position mypos;
        int myfirst;
        int mylast;
        int myfirstOP;
        int mylastOP;
        public ajs244Player(Position pos, int timeLimit) : base(pos, "HamSandwich", timeLimit)
        {
            mypos = pos;
            if (mypos == Position.Top) {
                myfirst = 7;
                mylast = 12;
                myfirstOP = 0;
                mylastOP = 5;
            }           
            else {
                myfirst = 0;
                mylast = 5;
                myfirstOP = 7;
                mylastOP = 12;
            }
        }

        public override int chooseMove(Board b)
        {
            // start clock
            Stopwatch clock = new Stopwatch();              
            clock.Start();                  
            
            // set initial depth
            int i = 1;

            // initialize move to store best move, best score value, and end of game? info
            // this variable will be updated to the best result set given by minimax
            Result move = new Result(0, 0, false);

            // try minimax search until either end of game reached or time limit reached
            try
            {
                while (!move.isEndGame())
                {
                    move = minimax(b, i++, clock, Int32.MinValue, Int32.MaxValue);
                }
            }
            // catch timed out exception and return the best move stored so far in the search
            catch (MoveTimedOutException) { }
            return move.getMove();
        }

        // b = current board state, d = depth, w = clock, alpha and beta to keep track of max/min values for pruning
        private Result minimax(Board b, int d, Stopwatch w, int alpha, int beta) 
        {
            // throw exception if time limit has reached
            if (w.ElapsedMilliseconds > getTimePerMove()) throw new MoveTimedOutException();
            
            // initialize variables
            int bestMove = 0;
            int bestVal;
            bool gameCompleted = false;
            if (b.gameOver() || d == 0)
            {
                return new Result(0, evaluate(b), b.gameOver());
            }

            // if it's my move, maximize
            if (b.whoseMove() == mypos)              // TOP is MAX
            {
                bestVal = Int32.MinValue;                   // set bestVal to lowest possible number to update later on
                for (int move = myfirst; move <= mylast; move++)      // loop through all possible moves for this player
                {
                    if (b.legalMove(move))                  // if it's a legal move, make that move, look at board and see if it is best move
                    {
                        Board b1 = new Board(b);                            // duplicate board
                        b1.makeMove(move, false);                           // make the move
                        Result val = minimax(b1, d - 1, w, alpha, beta);    // find its value
                        if (val.getScore() > bestVal)                       // remember if best maximum
                        {
                            bestVal = val.getScore();                       // update best move, value, and game state after this move
                            bestMove = move;
                            gameCompleted = val.isEndGame();
                        }
                        // update alpha
                        if (bestVal > alpha)
                        {
                            alpha = bestVal;
                        }
                    }
                }
            }
            // else minimize
            else
            {
                bestVal = Int32.MaxValue;               // set bestVal to highest possible number to update later on
                for (int move = myfirstOP; move <= mylastOP; move++)   // loop through all possible moves for this player
                {
                    if (b.legalMove(move))              // if it's a legal move, make that move, look at board and see if it is best move
                    {
                        Board b1 = new Board(b);                            // duplicate board
                        b1.makeMove(move, false);                           // make the move
                        Result val = minimax(b1, d - 1, w, alpha, beta);    // find its value
                        if (val.getScore() < bestVal)                       // remember if best minimum
                        {
                            bestVal = val.getScore();                       // update best move, value, and game state after this move
                            bestMove = move;
                            gameCompleted = val.isEndGame();
                        }
                        // update beta
                        if (bestVal < beta)
                        {
                            beta = bestVal;
                        }
                    }
                }
            }
            // return the Result set with best move,  score, and game status
            return new Result(bestMove, bestVal, gameCompleted);
        }

        // evaluates the board based on potential go-agains, captures, and stones each side has
        // and returns a score based on those values
        public override int evaluate(Board b)
        {
            int score = b.stonesAt(13) - b.stonesAt(6);
            int totalStones = 0;
            int goAgains = 0;
            int captures = 0;

            for (int i = 7; i <= 12; i++)
            {
                int priority = 0;
                int target = b.stonesAt(i) % (13 - i);
                int targetStonesAt = b.stonesAt(target + 7);
                if (b.whoseMove() == Position.Bottom)
                {
                    totalStones -= b.stonesAt(i);

                    if ((b.stonesAt(i) - (13 - i) == 0) || (b.stonesAt(i) - (13 - i)) == 13)
                    {
                        goAgains -= (1 + priority);
                    }
                    if (targetStonesAt == 0 && b.stonesAt(i) == (13 - i + target + 7))
                    {
                        captures += (b.stonesAt(i) + b.stonesAt(12 - target));
                    }
                }
                else
                {
                    totalStones += b.stonesAt(i);

                    if ((b.stonesAt(i) - (13 - i) == 0) || (b.stonesAt(i) - (13 - i)) == 13)
                    {
                        goAgains += (1 + priority);
                    }
                    if (targetStonesAt == 0 && b.stonesAt(i) == (13 - i + target + 7))
                    {
                        captures -= (b.stonesAt(i) + b.stonesAt(12 - target));
                    }
                }
                priority++;
            }

            for (int i = 0; i <= 5; i++)
            {
                int priority = 0;
                int target = b.stonesAt(i) % (13 - i);
                int targetStonesAt = b.stonesAt(target);
                if (b.whoseMove() == Position.Bottom)
                {
                    totalStones += b.stonesAt(i);

                    if ((b.stonesAt(i) - (6 - i) == 0) || (b.stonesAt(i) - (6 - i)) == 13)
                    {
                        goAgains -= (1 + priority);
                    }
                    if (targetStonesAt == 0 && b.stonesAt(i) == (13 - i + target))
                    {
                        captures -= (b.stonesAt(i) + b.stonesAt(12 - target));
                    }
                }
                else
                {
                    totalStones -= b.stonesAt(i);

                    if ((b.stonesAt(i) - (6 - i) == 0) || (b.stonesAt(i) - (6 - i)) == 13)
                    {
                        goAgains += (1 + priority);
                    }
                    if (targetStonesAt == 0 && b.stonesAt(i) == (13 - i + target))
                    {
                        captures += (b.stonesAt(i) + b.stonesAt(12 - target));
                    }
                }
                priority++;
            }

            score += totalStones + captures + goAgains;
            return score;
        }

        // player image
        public override String getImage() { return "Facepalm.jpg"; }

        // gloat message
        public override string gloat()
        {
            return "WINNER WINNER CHICKEN DINNER";
        }

    }
    class MoveTimedOutException : Exception { }

    // Result class stores sets of moves, scoes, and game states
    // used to store the best result set to return to chooseMove()
    class Result
    {
        private int Move;
        private int Score;
        private bool GameState;
        public Result(int move, int score, bool state)
        {
            Move = move;
            Score = score;
            GameState = state;
        }
        public int getMove()
        {
            return Move;
        }
        public int getScore()
        {
            return Score;
        }
        public bool isEndGame()
        {
            return GameState;
        }
    }
}