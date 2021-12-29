## Day 3

#### [Problem](https://adventofcode.com/2021/day/3)
Given a list of binary numbers evaluate the most common digit in each subsequent index of the numbers.
Take the most common digit in each index and create a new binary number as a result.

When given column contains the same amount of 0s and 1s - take 1 as the most common digit.


#### Input
List of binary numbers, e.g.:
```
00100
11110
10110
10111
```

#### Solution
1. Split each binary number into an array of digits
2. Transpose the array of arrays
3. Count the most common digit in each inner array (column)
4. Create a new binary number by joining most common digit in each index (in the above example
it will be 10110)


---
#### Part 2
Instead of creating a new binary number the goal is to find out 2 numbers among these collection:
- number which has the most common digit for each index at given position
- number which has the least common digit for each index at given position

These numbers then need to be multiplied.

#### Solution
1. Take the whole collection of binary numbers and evaluate the most common digit at the first index
2. Select all binary numbers that have the most common digit at first index
3. Pass these numbers to a recursive function and do the same for the second index, third etc.,
until the function returns the final number
4. Perform 2 iterations - one for the number with most common digits and the other for the least common
digits
