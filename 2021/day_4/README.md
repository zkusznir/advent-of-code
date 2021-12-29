## Day 4

#### [Problem](https://adventofcode.com/2021/day/4)
Having a bunch of bingo boards and numbers to draw evaluate which board will win first. Then sum up
the numbers that remain unchecked in the winning board and multiply this sum by the last drawn number.

#### Input
Input consists of 2 parts:
- a list of numbers to draw
- a list of bingo boards

#### Solution
1. Draw each number from the pool
2. Go through each board and remove given number from the board (substitute its value with nil)
3. Check if the board is a winning board
4. If there is no winning board yet - draw next number and repeat


---
#### Part 2
Instead of finding the first winning board the task is to find the last winning board.

#### Solution
Solution is very similar to the first part's solution - an additional thing is such that every winning board
is marked as winner so that it's not taken into account in subsequent draws. Also we then can control
amount of boards that have already won so that we can know which one is the last to win.
