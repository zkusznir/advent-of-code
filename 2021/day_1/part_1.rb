require "pry"

numbers = File.read("data.txt").split("\n").map(&:to_i)

result = numbers.each_cons(2).inject(0) do |increases_count, numbers_pair|
  increases_count +=1 if numbers_pair[1] > numbers_pair[0]
  increases_count
end

puts result
