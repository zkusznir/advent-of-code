require "pry"

numbers = File.read("data.txt").split("\n")

gamma_digits = 
  numbers
  .map { |number| number.split("") }
  .transpose
  .map { |position_digits| position_digits.count { |digit| digit == "0" } }
  .map { |count| count > 500 ? "0" : "1" }

epsilon_digits = gamma_digits.map { |digit| digit == "0" ? "1" : "0" }

# Alternative mapping for epsilon_digits
# https://www.calleluks.com/rubys-bitwise-operators/
# gamma_value    = gamma_digits.join.to_i(2)
# epsilon_digits = (gamma_digits.size - 1).downto(0).map { |i| (~gamma_value)[i] }.join

puts gamma_digits.join.to_i(2) * epsilon_digits.join.to_i(2)