require "pry"
require "./input_parser.rb"

class Bingo
  class << self
    def first_winner(draw_numbers, boards)
      winner     = nil
      board_size = boards.first.row_size

      last_draw = draw_numbers.find do |number|
        winner = boards.find do |board|
          mark(board, number)
          has_winning?(:row, board, number, board_size) || has_winning?(:column, board, number, board_size)
        end
      end

      { board: winner, last_draw: last_draw }
    end

    private

    def mark(board, number)
      return unless sweet_spot = board.find_index(number)

      board[*sweet_spot] = nil
    end

    def has_winning?(direction, board, number, board_size)
      (0..board_size).find do |index|
        board.send(direction, index).to_a.count { |number| number.nil? } == board_size
      end
    end
  end
end

input  = File.read("data.txt").split("\n\n")
winner = Bingo.first_winner(*InputParser.call(input))

puts winner[:board].to_a.flatten.compact.map(&:to_i).sum * winner[:last_draw].to_i
