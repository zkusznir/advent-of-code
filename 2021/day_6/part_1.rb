require "pry"

class PopulationCounter
  class << self
    EXPERIMENT_LENGTH_IN_DAYS = 80
    FIRST_SPAWN_PERIOD        = 9
    REGULAR_SPAWN_PERIOD      = 6

    def call(population)
      EXPERIMENT_LENGTH_IN_DAYS.times do
        refresh!(population)
      end

      population.size
    end

    private

    def refresh!(population)
      population.map! do |days_till_spawn|
        if days_till_spawn.zero?
          population << FIRST_SPAWN_PERIOD
          REGULAR_SPAWN_PERIOD
        else
          days_till_spawn - 1
        end
      end
    end
  end
end

input           = File.read("data.txt").split(",").map(&:to_i)
population_size = PopulationCounter.call(input)

puts population_size
