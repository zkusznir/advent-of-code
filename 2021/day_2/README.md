## Day 2

#### [Problem](https://adventofcode.com/2021/day/2)
Given a list of movement instructions evaluate how the object is moving in a 2D space
(horizontally or vertically). Object can move in 3 directions: forward, up or down.

The goal of the task is a to find a final placement of the object in the 2D space (so assuming
that the object starts its journey at point (0, 0) in the 2D space we need to evaluate its final
horizontal and vertical position and multiply these numbers).

#### Input
List of object's translation instruction in the following format:
```
forward 5
down 5
forward 8
up 3
down 8
forward 2
```

#### Solution
1. Iterate over list of instructions
2. Sum the amount of movement steps for each direction
3. As a result we have such hash data structure `{ "forward" => 100, "up" => 20, "down" => 40 }`
4. Multiply foward steps by the difference of up and down steps


---
#### Part 2
The second part of the day is different from the first one in such that:
- `up` and `down` commands do not move the object by X units in vertical direction but they
increase/decrease the aim of the object
- the `forward` command increases horizontal position by X units and increases depth by
current aim multiplied by X
