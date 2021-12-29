require "matrix"

class InputParser
  class << self
    def call(raw_input, task_number)
      draw   = raw_input[0].split(",")
      boards = parse_raw_boards_input(raw_input[1..-1], task_number)

      [draw, boards]
    end

    private

    # This parser is shared among solutions to part 1 and part 2 and the output
    # is dependent on which part we're solving right now.
    def parse_raw_boards_input(input, task_number)
      input.map do |raw_board|
        rows = raw_board.split("\n").map { |row| row.split(" ") }
        task_number == :part_1 ? Matrix[*rows] : { input: Matrix[*rows], is_winner: false }
      end
    end
  end
end
