## Day 5

#### [Problem](https://adventofcode.com/2021/day/5)
Having a 2D space we need to draw/imagine a list of lines and count the number of points where
at least 2 lines overlap. The lines are only drawn horizontally and vertically.

#### Input
Input consists of a list of instructions in the following format: `x1,y1 -> x2,y2` where:
- `x1,y1` is the start point of the line
- `x2,y2` is the end point of the line

Example:
```
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
```
The above instructions "draw" 3 lines in the 2D spcce.

#### Solution
1. Initialize an empty hash where each key is a pair of (x,y) coordinates in 2D space
2. For each line take its start point and end point
3. "Draw" a line by populating each point of this line in the hash data structure
4. For each point in the line add 1 to its value

Example: Having 2 lines:
- 1,3 -> 3,3
- 2,2 -> 


---
#### Part 2
Instead of finding the first winning board the task is to find the last winning board.

#### Solution
Solution is very similar as in first part - an additional thing is such that every winning board
is marked as winner so that it's not taken into account in subsequent draws. Also we then can control
amount of boards that have already won so that we can know which one is the last to win.
