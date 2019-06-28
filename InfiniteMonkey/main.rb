require_relative 'entity'
require_relative 'utility'

def run
  p 'Type the word to match'
  to_match = gets.chomp
  population = []

  #populate the initial generation
  500.times do
    population << Entity.new(Utility.random_string(to_match.size), to_match)
  end

  i = 0
  #iterate untill he match our phrase
  while true do
    next_generation = []
    population.size.times do
      father = Entity.extract_entity(population)
      mother = Entity.extract_entity(population)
      next_generation << mother.crossover(father)
      p next_generation[-1].to_s + " Fitness: #{next_generation[-1].fitness}"
      if next_generation[-1].fitness == to_match.size
        p "Found world with generation n° #{i}"
        return
      end
      i += 1
    end
    population = next_generation.dup
  end
end

run