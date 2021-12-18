require "pry"
require "./input_parser.rb"

class OverlapCounter
  class << self
    def call(lines)
      lines.each_with_object(Hash.new(0)) do |(start_point, end_point), map|
        if start_point[0] == end_point[0]
          draw_line(start_point[1], end_point[1], start_point[0], map, :x_direction)
        elsif start_point[1] == end_point[1]
          draw_line(start_point[0], end_point[0], start_point[1], map, :y_direction)
        else
          draw_diagonal_line(start_point, end_point, map)
        end
      end
    end

    private

    def draw_line(moving_index_1, moving_index_2, fixed_index, map, direction)
      line_range = moving_index_1 < moving_index_2 ? moving_index_1..moving_index_2 : moving_index_2..moving_index_1

      line_range.each do |index|
        if direction == :x_direction
          map[[fixed_index, index]] += 1
        elsif direction == :y_direction
          map[[index, fixed_index]] += 1
        end
      end
    end

    def draw_diagonal_line(start_point, end_point, map)
      x_operator = start_point[0] < end_point[0] ? :upto : :downto
      y_operator = start_point[1] < end_point[1] ? :+ : :-

      start_point[0].send(x_operator, end_point[0]).each_with_index do |x_coordinate, index|
        y_coordinate = start_point[1].send(y_operator, index)
        map[[x_coordinate, y_coordinate]] += 1
      end
    end
  end
end

input  = File.read("data.txt")
intersection_points_map = OverlapCounter.call(InputParser.call(input))

puts intersection_points_map.count { |_, intersections_count| intersections_count > 1}
