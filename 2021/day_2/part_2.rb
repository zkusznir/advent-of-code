require "pry"

commands = File.read("data.txt").split("\n")

aim = 0

direction_moves = commands.each_with_object(Hash.new(0)) do |command, summary|
  direction, value = command.split(" ")
  value            = value.to_i

  if direction == "forward"
    summary["forward"] += value
    summary["depth"]   += value * aim
  else
    aim = direction == "down" ? aim + value : aim - value
  end
end

puts direction_moves["forward"] * direction_moves["depth"]

