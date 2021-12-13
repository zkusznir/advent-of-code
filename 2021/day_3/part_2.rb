require "pry"

class Solver
  class << self
    def numbers_with_most_common_digit(numbers, index, digit_type)
      return numbers.first if numbers.size == 1

      # Determine most common digit at given position for array of binary numbers
      most_common_digit = most_common_digit_for(numbers, index)
      # Determine whether we're looking for most common or least common digit
      desired_digit = digit_type == :most_comon ? most_common_digit : flip(most_common_digit)

      # Filter the numbers to pick only such that include most/least common digit at given position
      matching_numbers = numbers.select { |number| number[index] == desired_digit }

      # Continue recursion on filtered array
      numbers_with_most_common_digit(matching_numbers, index + 1, digit_type)
    end

    private

    def most_common_digit_for(numbers, index)
      batch_size        = numbers.size
      sorted_numbers    = numbers.sort_by { |number| number[index] }

      sorted_numbers[(batch_size/2.to_f).floor][index]
    end

    def flip(digit)
      digit == "0" ? "1" : "0"
    end
  end
end

numbers = File.read("data.txt").split("\n")

most_common_digits_number  = Solver.numbers_with_most_common_digit(numbers, 0, :most_comon).to_i(2)
least_common_digits_number = Solver.numbers_with_most_common_digit(numbers, 0, :least_comon).to_i(2)

puts most_common_digits_number * least_common_digits_number
