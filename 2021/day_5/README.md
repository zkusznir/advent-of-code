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
The above instructions "draw" 3 lines in the 2D space.

#### Solution
1. Initialize an empty hash where each key is a pair of (x,y) coordinates in 2D space
2. For each line take its start point and end point
3. "Draw" a line by populating each point of this line in the hash data structure (not only start
and end points of the line but every point that is included in the line)
4. For each point in the line add 1 to its value

Example: Having 2 lines:
- 1,3 -> 3,3
- 2,2 -> 2,4

applying the above solution to these lines the hash data structure will be populated in the following manner:
```
[1, 3] += 1
[2, 3] += 1
[3, 3] += 1
[2, 2] += 1
[2, 3] += 1
[2, 4] += 1
```
And we can see that as a result we have a value of 2 for `[2, 3]` key pair. Eventually we're looking
for amount of such keys in the hash data structure where value is at least 2 (at least 2 lines overlapped
in this point).

---
#### Part 2
In addition to horizontal and vertical lines we need to "draw" diagonal lines.

#### Solution
The mechanism for vertical and horizontal lines is the same as in part 1 of the task. Additionally
we need to draw diagonal lines - while drawing we shift both x and y indices in the hash data
structure by 1 (because for vertical and horizontal lines one of the indices is always frozen).
