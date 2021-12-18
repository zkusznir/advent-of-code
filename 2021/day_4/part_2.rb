require "pry"
require "./input_parser.rb"

class Bingo
  class << self
    BOARD_SIZE = 5

    def first_winner(draw_numbers, boards)
      draw_numbers.each do |number|
        boards.each do |board|
          next if board[:is_winner]

          mark(board[:input], number)

          if has_winning?(:row, board[:input], number) || has_winning?(:column, board[:input], number)
            last_winner_board = board
            last_draw         = number
            board[:is_winner] = true
          end

          if boards.all? { |board| board[:is_winner] }
            return { board: last_winner_board[:input], last_draw: last_draw }
          end
        end
      end
    end

    private

    def mark(board, number)
      return unless sweet_spot = board.find_index(number)

      board[*sweet_spot] = nil
    end

    def has_winning?(direction, board, number)
      (0..BOARD_SIZE).find do |index|
        board.send(direction, index).to_a.count { |number| number.nil? } == BOARD_SIZE
      end
    end
  end
end

input  = File.read("data.txt").split("\n\n")
winner = Bingo.first_winner(*InputParser.call(input))

puts winner[:board].to_a.flatten.compact.map(&:to_i).sum * winner[:last_draw].to_i
