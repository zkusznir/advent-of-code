class InputParser
  class << self
    def call(raw_input)
      raw_input.split("\n").map do |line|
        line.split(" -> ").map do |points|
          coordinates = points.split(",").map(&:to_i)
        end
      end
    end
  end
end
