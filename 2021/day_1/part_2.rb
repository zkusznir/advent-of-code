require "pry"

numbers = File.read("data.txt").split("\n").map(&:to_i)

result = numbers.each_cons(4).inject(0) do |increases_count, numbers_group|
  increases_count +=1 if numbers_group.last(3).sum > numbers_group.first(3).sum
  increases_count
end

puts result
