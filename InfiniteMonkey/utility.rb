module Utility
  def self.random_string(size)
    return (0...size).to_a.map {random_char}.join
  end

  def self.random_char
    (('A'..'z').to_a << ' ').sample
  end
end