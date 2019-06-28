require_relative 'utility'
class DNA
  attr_reader :genes
  # 1% chance to mutate each DNA gene.
  MUTATION_PROB = 1

  def initialize(genes)
    @genes = genes
  end

  def mutate
    @genes.size.times do |i|
      @genes[i] = Utility.random_char if rand(0..100) < MUTATION_PROB
    end
    self
  end
end