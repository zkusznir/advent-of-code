require "matrix"

class InputParser
  class << self
    def call(raw_input)
      draw   = raw_input[0].split(",")
      boards = parse_raw_boards_input(raw_input[1..-1])

      [draw, boards]
    end

    private

    def parse_raw_boards_input(input)
      input.map do |raw_board|
        rows = raw_board.split("\n").map { |row| row.split(" ") }
        Matrix[*rows]
      end
    end
  end
end
