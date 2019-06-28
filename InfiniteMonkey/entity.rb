require_relative 'dna'
class Entity
  attr_reader :dna, :fitness

  def initialize(word, target)
    @dna = DNA.new(word.split(''))
    @target = target
    @fitness = calculate_fitness
  end

  def to_s
    @dna.genes.join('')
  end

  def calculate_fitness
    score = 0
    @target.split('').each_with_index do |char, index|
      score += 1 if char == @dna.genes[index]
    end
    score
  end

  def mutate
    @dna.mutate
    calculate_fitness
    self
  end

  #choose a random mid point and perform crossover and mutation
  def crossover(entity_b)
    dna_size = self.dna.genes.size
    mid_point = rand(0..dna_size)
    dna_string = self.dna.genes[0...mid_point].join + entity_b.dna.genes[mid_point...dna_size].join
    Entity.new(dna_string, @target).mutate
  end

  # select entity prioritizing his fitness
  # weighted array selection
  def self.extract_entity(entities)
    max = entities.map(&:fitness).inject(0, :+)
    target = rand(1..max)
    entities.each do |entity|
      return entity if target <= entity.fitness
      target -= entity.fitness
    end
  end

end