## Day 1

#### [Problem](https://adventofcode.com/2021/day/1)
Given a list of integer numbers evaluate how many times each consecutive number has increased
when compared to the previous number in the list.

#### Input
List of integer values.

#### Solution
Iterate over each consecutive pair of numbers within the list and compare the numbers of the pair
with each other. Count amount of situations where subsequent number (the second in the pair)
is greater than the first one.

---
#### Part 2
Instead of comparing 2 numbers within each consecutive pair we need to:
- take the group of 4 consecutive numbers
- compare the sum of first 3 numbers with the sum of last 3 numbers within given group
- if the sum of last 3 numbers > sum of first 3 numbers -> we count it in as increase

And we do it for each window of 4 numbers (every time we shift by 1 number, not 4 numbers).
