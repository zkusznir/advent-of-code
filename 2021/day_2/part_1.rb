require "pry"

commands = File.read("data.txt").split("\n")

direction_moves = commands.each_with_object(Hash.new(0)) do |command, summary|
  direction, value    = command.split(" ")
  summary[direction] += value.to_i
end

puts direction_moves["forward"] * (direction_moves["down"] - direction_moves["up"])
